#!/bin/sh

sleep 2

# setting up SWAP
# get some swap memory so that the process doesn't die
# edit file /etc/dphys-swapfile and change CONF_SWAPSIZE value from 100 to 4096
clear
sleep 1
echo "=> SETTING UP SWAP ASSUMING IT's a 32 GB partition"
sudo sed -i '/CONF_SWAPSIZE=100/s/^#*\s*//g' /etc/dphys-swapfile
sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=4096/' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
echo "\n=> 4GB SWAP PARTITION activated! \n"
sleep 1
clear
sleep 1

# Installing RPi.GPIO
echo "=> SETTING UP RPi.GPIO Lib.. \n"
sudo pip3 install RPi.GPIO
sudo pip install RPi.GPIO
echo "\n=> GPIO library INSTALLED!\n"
sleep 1
clear
sleep 1

# installing pi power manager
echo "=> SETTING UP SAFE POWERING UTILITY.. \n"
git clone https://github.com/Howchoo/pi-power-button.git
sudo chmod u+x pi-power-button/script/install
sudo ./pi-power-button/script/install
sudo rm -rf pi-power-button/
echo "=> SAFE POWERING UTILITY SETUP COMPLETE! \n"
sleep 1
clear
sleep 1


sudo pip3.6 install pyserial


# sudo nano /boot/config.txt
# disables the Bluetooth device and restores UART0/ttyAMA0 to GPIOs 14 and 15
sudo echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt
sudo systemctl disable hciuart

echo "=> ALL THE INSTALLTION SUCCEFULLY FINISHED! :) \n\n"


sleep 4

echo "... REBOOTING NOW ..."

sleep 3

sudo reboot
