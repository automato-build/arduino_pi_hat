# arduino_pi_serial

Assuming you are using [latest raspbian lite terminal only image](http://downloads.raspberrypi.org/raspbian/release_notes.txt) 

(we do not need GUI crap ATM).


Also assuming you have **updated**, **upgraded** and **set your locales** from the `raspi-config`. 

### CONFIGURE HARDWRAE SERIAL INTERFACE


`sudo raspi-config`


Then select **disbale console over serial**


and then select **enable hardware serial**
`sudo reboot`


Then run


`sudo ./setup_script.sh`


This sets fixes some setup

We are suing foot print of [Arduino Pro mini 3.3 V 8mHz](https://cdn.sparkfun.com/datasheets/Dev/Arduino/Boards/Arduino-Pro-Mini-v14.pdf) for the HAT in the schematic as PI's logic levels are all 3.3V. 
![GitHub Logo](/imgs/arduino.png)
Format: ![Alt Text](url)
We are also providing some external 5 Volt supply for which we have created some back current 
and voltage surge protection circuit following the guidelines of Raspvbberry pi HAT design guides.[link]
[image]
Also we have provided some Breakout GPIO pins for both Arduino and PI. (Note: Not all the pins are broken out.
You mighht need to solder few wires)
