#45mic - Auto-Sprinkler

This is the firmware for the **Auto-Sprinkler** project. It controls a soil moisture sensing and pumping system using a PIC microcontroller.

##Project Components
This project uses **MCC Melody** for peripheral configuration.

* **Main Logic:** `main.c`
* **Peripherals / Modules:**
  * `soilSensorLib.c`: ADC and soil moisture logic.
  * `pumpLib.c`: Relay/Pump control logic.
  * `lcdLib.c`: Display interface.
  * `asmLib.s`: Low-level Assembly optimizations/functions.

##Software Requirements
* **IDE:** MPLAB X IDE (v6.xx or newer)
* **Compiler:** XC8 (for C files) and pic-as (for .s files)
* **Configurator:** Microchip Code Configurator (MCC) - uses `micro_MAC_final_project_v001.mc3`

##Hardware Requirments
 *uController: PIC24FJ64GA002  
 *_Display_  
 *_Actuator_  
 *_Power_  
 *_Sensors_  

##_Pinout Table_

##Getting Started
1. Clone this repository to your local machine.
2. Open MPLAB X IDE.
3. Go to **File > Open Project** and select the folder ending in `.X` (inside the `nbproject` folder).
4. If the compiler is missing, go to **Project Properties** and select your local version of XC8.
5. Click **Clean and Build**.

##Notes
* The file `mcc-manifest-autosave.yml` contains the library versions used during development.
* Avoid committing the `build/` or `dist/` folders.
