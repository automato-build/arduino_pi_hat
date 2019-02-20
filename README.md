# arduino_pi_serial

Assuming you are using [latest raspbian lite terminal only image](http://downloads.raspberrypi.org/raspbian/release_notes.txt) 
(we do not need GUI crap ATM).

Also assuming you have **updated**, **upgraded** and **set your locales** from the `raspi-config`. 

### CONFIGURE HARDWRAE SERIAL INTERFACE:
In `raspi-config`, under `interfaces` option **disbale console over serial** and then select **enable hardware serial**.

`sudo reboot`

Then run

`sudo ./setup_script.sh`

This sets fixes some setup

### A BIT ABOUT THE HARDWARE:
We are suing foot print of [Arduino Pro mini 3.3 V 8mHz](https://cdn.sparkfun.com/datasheets/Dev/Arduino/Boards/Arduino-Pro-Mini-v14.pdf) for the HAT in the schematic as PI's logic levels are all 3.3V. 
![](/imgs/arduino.png)
We are also providing some external 5 Volt supply for which we have created some back current 
and voltage surge protection circuit following the guidelines of Raspvbberry pi HAT [design guides](https://github.com/raspberrypi/hats/blob/master/designguide.md)
![](/imgs/voltage_circuit.png)

Also we have provided some Breakout GPIO pins for both Arduino and PI. (**Note**: _Not all the pins are broken out.You mighht need to solder few wires._)

![PI's few breakouts](/imgs/pi_breakouts.png)
![ATMega's few breakouts](/imgs/arduino_breakouts.png)

We have also broken out ISP Ports for burning bootloader to ATMEga328. 
PLease [follow this guide](http://www.electronoobs.com/eng_arduino_tut6.php) here on how to do so. 
Only keep in mind few thing:
1. Use another Arduino Pro mini 3.3 V 8MHz as ISP programmer (folow the guide above on how to prepapre an Arduino for burning bootloader). Also use a 3.3 V logic enabled FTDI board for this master pro mini as pro minis do not have USB interface like pro micros. Don't forget to enable 3.3 V logic on it. Most boards have a jumper to switch between logic levels)
![]()
2. Also connect the ISP ports from this board (Will be marked on the baord) to the _MOSI_, _MISO_, _SCK_ and _CS_ pins of the programmer Arduino Pro mini. Rest follow the guide of burning bootloader.
3. Then you can use the same FTDI programmer  with the programming pads on the board to upload your code to the ATmega328.

In the design we have connected _PI's RX_ to Arduino's digital _pin 3_ and _PI's TX_ to Arduino's digital _pin 2_. We would be using **"SoftwareSerial"** lib on Arduino's side to confifure those pins as _software serial pins_ to establish serial communication with PI. This way we can keep the FTDI programmer attached to the programming pads on the baord to use Arduino's default Serial port for debugging the ATMega328. 
