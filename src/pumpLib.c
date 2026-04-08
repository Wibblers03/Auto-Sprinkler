/* 
 * File: MAC_pumpLib.c
 * Author: Micah Cortes
 *
 * Created on April 23, 2025, 6:30 PM
 */

#include "xc.h"
#include "pumpLib.h"

void setupPump(void){
    TRISBbits.TRISB4 = 0;       //makes RB4 an output for water pump
    CNPU1bits.CN14PUE = 1;      //pull up resistor for RB12
    TRISBbits.TRISB12 = 1;      //makes RB12 an input to read button press
}

/*
 * the button state function checks the state of RB12 and stores it into int state
 * if state == 0, button has been pressed
 * also checks the previous state of activate to ensure the button can be pressed multiple times
 * to turn the automatic mode on or off 
 */ 
int buttonState(int activate){
    int state = PORTBbits.RB12;     //reads current state of button press
    if(state == 0){
        if(activate == 0){
            activate = 1;
        }else{
            activate = 0; 
        }
    } 
    return activate;
}

//easier to visualize calling these function in rather then LATBbits blah blah blah
void turnOnPump(void){
    LATBbits.LATB4 = 1;     //sets RB4 HIGH which controls the pump 
}
void turnOffPump(void){
    LATBbits.LATB4 = 0;     //sets RB4 LOW which controls the pump 
}