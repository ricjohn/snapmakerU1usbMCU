# snapmakerU1usbMCU
klipper config for using an old mcu (creality 1.1.5 in my case) for additional hardware like chamber heater and fans

Included changes:
- requires installation of customer firmware like https://github.com/paxx12-snapmaker-u1/SnapmakerU1-Extended-Firmware
- file permission to allow klipper to use the usb device
- klipper config to setup the new hardware

How to setup
- install custom firmware
- enable ssh access
- log into printer via ssh with root permissions
- execute restore_second_mcu.sh to setup permissions for klipper to access the mcu on the external usb port
-- adapt usb id to match your mcu 
- add the config file using the new mcu to /home/lava/printer_data/config/extended/klipper/ (or to /extended/klipper/ in the fluidd config ui)
-- adapt the config file to match the connected hardware 
- make sure to connect the new mcu to the rear usb port before restarting klipper with the new config
