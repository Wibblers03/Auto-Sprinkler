//LCD library
//initialize and communicate to LCD with I2C protocol
//Author: Micah Cortes
//Student ID #: 5698106
//Email: corte251@umn.edu
//Date: 04/03/2025

#include "xc.h"
#include "lcdLib.h"
#include "asmLib.h"
#define CONTRAST 0x7A

void lcd_init(void){
    //initalizes LCD by turning on I2C1, resets the LCD, 
    //and running the start up commands dictated by datasheet

    TRISBbits.TRISB6 = 0;       //makes RB6 an output for LCD
    LATBbits.LATB6 = 1;         //sets pin 6 HIGH to reset LCD
    
    I2C1BRG = 157;
    _MI2C1IF = 0;
    I2C1CONbits.I2CEN = 1;
    
    //reset LCD on power up
    delayms(5);
    LATBbits.LATB6 = 0;
    delayms(9);
    LATBbits.LATB6 = 1;
    delayms(1);
    
    delayms(40);
    
    lcd_cmd(0x3A);      //Function Set
    lcd_cmd(0x09);      //Extended Function Set
    lcd_cmd(0x06);      //Entry Mode Set
    lcd_cmd(0x1E);      //Bias Setting
    
    
    lcd_cmd(0x39);      //Function Set
    lcd_cmd(0x1B);      //Internal OSC
    lcd_cmd(0x6E);      //Follower Control
    
    delayms(200);
    
    lcd_cmd(0x56);      //Power Control
    lcd_cmd(CONTRAST);  //Contrast Set
    
    lcd_cmd(0x38);      //Function Set
    lcd_cmd(0x0F);      //Display On
    lcd_cmd(0x01);      //Clear Display
    
    delayms(1);
    
    //changes LCD to 2 row mode
    /* Function set (RE=1 version) */
    lcd_cmd(0x3a); /* DL, N, ~BE, enter extended mode RE=1, ~REV */ 
    /* Extended function set (assumes RE=1) */
    lcd_cmd(0x09); /* NW, ~FW, ~B/W */
    /* Double-height/bias/dot-shift (assumes RE=1) */
    lcd_cmd(0x1a); /* UD2, ~UD1, BS1, ~DH? */
    /* Function set (RE=0 version, IS=0) */
    lcd_cmd(0x3c); /* DL, N, DH, return to RE=0, ~IS */
    
    lcd_cmd(0x01);  //reset the screen
}

void lcd_cmd(int command){
    //function to take a command and write it to LCD with I2C protocol
    
    _MI2C1IF = 0;               //clear I2C flag
    I2C1CONbits.SEN = 0b1;      //initiates start condition
    while(I2C1CONbits.SEN == 1);       //wait for start bit to finish
    
    _MI2C1IF = 0;               //clear I2C flag
    I2C1TRN = 0x78;             //target address and R/nW bit             
    while(_MI2C1IF == 0);       
    
    _MI2C1IF = 0;               //clear I2C flag
    I2C1TRN = 0x00;             //control byte (0x00 command)
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;               //clear I2C flag
    I2C1TRN = command;          //take char command
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;
    I2C1CONbits.PEN = 0b1;      //initiates stop condition
    while(I2C1CONbits.PEN == 1);
    
}

void lcd_setCursor(char x, char y){
    int xyconversion = 0x20*y + x;
    int location = 0x80|xyconversion;
    lcd_cmd(location);
}

void lcd_printChar(char myChar){
    
    _MI2C1IF = 0;
    I2C1CONbits.SEN = 1;
    while(I2C1CONbits.SEN == 1);
    
    _MI2C1IF = 0;
    I2C1TRN = 0x78;
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;
    I2C1TRN = 0x40;
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;
    I2C1TRN = myChar;
    while(_MI2C1IF == 0);
     
    _MI2C1IF = 0;
    I2C1CONbits.PEN = 0b1;      //initiates stop condition
    while(I2C1CONbits.PEN == 1);

}

void lcd_printStr(const char * string, int stringLen){      
    //this function takes advantage of consecutive writes to write out a string on the LCD
    //takes a int which determines the how long the for loop will run for
    _MI2C1IF = 0;
    I2C1CONbits.SEN = 1;
    while(I2C1CONbits.SEN == 1);        //start bit
    
    _MI2C1IF = 0;
    I2C1TRN = 0x78;
    while(_MI2C1IF == 0);
    
    for(int i = 0; i < stringLen-1; i++){
        
        _MI2C1IF = 0;
        I2C1TRN = 0xC0;
        while(_MI2C1IF == 0);
        
        _MI2C1IF = 0;
        I2C1TRN = string[i];
        while(_MI2C1IF == 0);
    }
    
    _MI2C1IF = 0;
    I2C1TRN = 0x40;
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;
    I2C1TRN = string[stringLen-1];
    while(_MI2C1IF == 0);
    
    _MI2C1IF = 0;
    I2C1CONbits.PEN = 0b1;      //initiates stop condition
    while(I2C1CONbits.PEN == 1);
    
}
