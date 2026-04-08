/* 
 * File: LCD Library I2C
 * Author: MIcah Cortes
 *
 * Created on April 26th 2025
 */

#ifndef LCDLIB_H
#define	LCDLIB_H

#include "xc.h"

#ifdef	__cplusplus
extern "C" {
#endif

void lcd_init(void);

void lcd_cmd(int command);

void lcd_setCursor(char x, char y);

void lcd_printChar(char myChar);

void lcd_printStr(const char * string, int stringLen);


#ifdef	__cplusplus
}
#endif

#endif	/* LCDLIB_H */

