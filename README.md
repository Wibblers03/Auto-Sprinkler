#45mic - Micro MAC Final Project

This is the firmware for the **Micro MAC** project. It controls a soil sensing and pumping system using a PIC microcontroller.

##Project Components
This project uses **MCC Melody** for peripheral configuration.

* **Main Logic:** `MAC_main_v1.c`
* **Peripherals / Modules:**
  * `MAC_soilSensorLib`: ADC and soil moisture logic.
  * `MAC_pumpLib`: Relay/Pump control logic.
  * `MAC_lcdLib`: Display interface.
  * `MAC_asmLib_v1.s`: Low-level Assembly optimizations/functions.

##Software Requirements
* **IDE:** MPLAB X IDE (v6.xx or newer)
* **Compiler:** XC8 (for C files) and pic-as (for .s files)
* **Configurator:** Microchip Code Configurator (MCC) - uses `micro_MAC_final_project_v001.mc3`

##Getting Started
1. Clone this repository to your local machine.
2. Open MPLAB X IDE.
3. Go to **File > Open Project** and select the folder ending in `.X` (inside the `nbproject` folder).
4. If the compiler is missing, go to **Project Properties** and select your local version of XC8.
5. Click **Clean and Build**.

##Notes
* The file `mcc-manifest-autosave.yml` contains the library versions used during development.
* Avoid committing the `build/` or `dist/` folders.