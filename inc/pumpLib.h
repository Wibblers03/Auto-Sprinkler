/* 
 * File: MAC__pumpLib.h
 * Author: Micah Cortes
 *
 * Created on April 23, 2025, 6:16 PM
 */

#ifndef PUMPLIB_H
#define	PUMPLIB_H

#include "xc.h"

#ifdef	__cplusplus
extern "C" {
#endif

void setupPump (void);

int buttonState (int activate);

void turnOnPump (void);

void turnOffPump (void);

#ifdef	__cplusplus
}
#endif

#endif	/* PUMPLIB_H */

