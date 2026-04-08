/* 
 * File: MAC_soilSensorLib.c
 * Author: Micah Cortes
 *
 * Created on April 2 PM
 */
#include "xc.h"
#include "MAC_soilSensorLib.h"
#define BUF_SIZE 32
#define NUMSAMPLES 0b01

volatile int circBuf[BUF_SIZE] = {0};   //buffer of n size based on compiler macro
volatile int bufPointer = 0;        //pointer used to ensure buffer is FIFO

void setupADC(void){
    TRISAbits.TRISA0 = 1; // should be input by default, but just for safety...
        
    AD1PCFGbits.PCFG0 = 0; // setup I/O
        
    AD1CON2bits.VCFG = 0b000; // Use AVDD (3.3V) and AVSS (0V) as max/min
    AD1CON3bits.ADCS = 1; // You want TAD >= 75ns (Tcy = 62.5ns)
    AD1CON1bits.SSRC = 0b010; // sample on timer3 events
    AD1CON3bits.SAMC = 1; // You want at least 1 auto sample time bit
    AD1CON1bits.FORM = 0b00; // data output form -- recommended unsigned int
                                // unsigned: 0V = 0b00000000, 3.3V = 0b11111111
                                // signed: 0V = 0b10000000, 3.3V = 0b0111111
    AD1CON1bits.ASAM = 1; // read the reference manual to see what this does, Begin right after completion
    AD1CON2bits.SMPI = 1; // read the reference manual to see what this does, reset after every completion
    AD1CON1bits.ADON = 1; // Turn on ADC
}

void initSensor (void){
    //resets buffer to have all values of 0 and resets bufPointer back to first position
    for(int i = 0; i < BUF_SIZE; i++){
        circBuf[i] = 0;
    }
    bufPointer = 0;
}

//gets the average of whatever is in circBuf, returns a long double as a decimal
long double getAvg(void){
    
    long double sum = 0;
    long int size = 0;
    long double avg = 0;
    
    for(int i = 0; i < BUF_SIZE; i++){
        sum = sum + circBuf[i];
        //only want to inc size if the ADC reads a non zero value for first 128 samples
        if(circBuf[i] != 0){
            size++;
        }
    }
    //if no values in the circBuf were greater then 0 add 1 to size to ensure avg isn't divided by 0
    if(size == 0){
        size++;
    }
    avg = sum/size;
    return avg;
}

//takes some int value and stores it into the circBuf FIFO
void putVal (int newVal){
    
    circBuf[bufPointer] = newVal;
    bufPointer++;
    //if the pointer is greater than the size of the buffer it resets the pointer
    if(bufPointer >= BUF_SIZE-1){
        bufPointer = 0;
    }
}

