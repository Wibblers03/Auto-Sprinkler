/* 
 * File: MAC_main_v1.c
 * Author: Micah Cortes
 *
 * Created on April 23, 2025, 5:15 PM
 */
#include <stdio.h>
#include <stdlib.h>
#include "asmLib.h"
#include "soilSensorLib.h"
#include "lcdLib.h"
#include "pumpLib.h"

#define BUF_SIZE 32        //buffer size
#define NUMSAMPLES 0b01     //numsamples can be 0b00, 0b01(16sp/s), 0b10(128sp/s) or 0b11
#define CONTRAST 0x7A       //sets contrast of LCD

// CW1: FLASH CONFIGURATION WORD 1 (see PIC24 Family Reference Manual 24.1)
#pragma config ICS = PGx1          // Comm Channel Select (Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1)
#pragma config FWDTEN = OFF        // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config GWRP = OFF          // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF           // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF        // JTAG Port Enable (JTAG port is disabled)


// CW2: FLASH CONFIGURATION WORD 2 (see PIC24 Family Reference Manual 24.1)
#pragma config I2C1SEL = PRI       // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF       // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = ON       // Primary Oscillator I/O Function (CLKO/RC15 functions as I/O pin)
#pragma config FCKSM = CSECME      // Clock Switching and Monitor (Clock switching is enabled, 
// Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL      // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))

void setup(void){
    CLKDIVbits.RCDIV = 0;       //Set RCDIV = 1:1 (default 2:1) 32MHz or FCY/2=16M
    AD1PCFG = 0xFFFE;           //sets pins to digital, besides AN0 which is where we are reading analog input
}

void setupInterrupt(void){
    _AD1IF = 0; // Clear IF
    _AD1IE = 1; // enable interrupts
        
    TMR3 = 0; // setup timer3
    T3CON = 0; 
    T3CONbits.TCKPS = NUMSAMPLES;   //prescaler for timer PR3 0b01 is 16 samples per second and 0b10 is 128 samples per secoond
    PR3 = 15624;
    T3CONbits.TON = 1;
}

void __attribute__ ((__interrupt__)) _ADC1Interrupt (void){
    putVal(ADC1BUF0);   //stores most recent value from ADC into circBuf
    IFS0bits.AD1IF = 0;     //resets interrupt flag
}

void delayms(int delay_ms){            //takes an int and converts it into a delay of x microseconds
    for(int i=0; i < delay_ms; i++){
        delay_1ms();
    }
}

void delayus(int delay_us){             //takes an int and converts it into a delay of x milliseconds
    for(int i=1; i < delay_us; i++){
        delay_1us();
    } 
}

void main(void) {

    //calls all setup functions
    setup();
    initSensor();
    setupADC();
    lcd_init();
    setupPump();
    setupInterrupt();
    
    //sets up variables for logic in main function
    double average;     //double that holds average value from adc
    char topRow[9] = {"Moisture:"};     //char to be posted in top row
    int activate = 0;       //flag to determine state of button press
    
    while(1){

    	average = getAvg();     //gets average of last recorded in the soilSensorLib
        
        lcd_setCursor(0,0);         //resets cursor position
        lcd_printStr(topRow,9);     //displays "Moisture" on top row of LCD
        lcd_setCursor(0,1);         //moves cursor to bottom row
        
        delayms(5);     //polling for button press
        activate = buttonState(activate);      
        delayms(10);    //polling for button press
        
        /*
         * 931 and 760 come from testing soil with the soil sensor from a sample with a desired moisture level
         * if the soil sensor reads a value from +760 then pump will be turned off and a message will be displayed
         * the pump only gets turned on if the moisture level is too low and the automatic mode has been activated (button on breadboard is pressed)
         */
        if(average >= 931){
            lcd_printStr("Too Wet!",8);
            turnOffPump();
        }else if(average > 760 && average < 931){
            lcd_printStr("Perfect!",8);
            turnOffPump();
        }else if(average <= 760){
            lcd_printStr("Too Dry!", 8);
            if(activate == 1){
                turnOnPump();
            }else if(activate == 0){
                turnOffPump();
            }
            
        }
        delayms(100);       //delay to allow LCD refresh without flickering
    }
    return;
}
