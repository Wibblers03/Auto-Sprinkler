/* 
 * File: MAC_soilSensorLib.h
 * Author: Micah Cortes
 *
 * Created on April 23, 2025, 5:32 PM
 */

#ifndef SOILSENSORLIB_H
#define	SOILSENSORLIB_H

#include "xc.h"

#ifdef	__cplusplus
extern "C" {
#endif

void initSensor (void);

void setupACD (void);

long double getAvg(void);

void putVal (int newValue);

#ifdef	__cplusplus
}
#endif

#endif	/* SOILSENSORLIB_H */

