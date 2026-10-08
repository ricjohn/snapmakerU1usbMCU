#!/bin/sh

# 1. Re-enable system persistence
echo "[1/4] Enabling OS persistence..."
touch /oem/.debug

# 2. Ensure the directory for udev rules exists
echo "[2/4] Checking udev directory..."
mkdir -p /etc/udev/rules.d

# 3. Write the udev rule for the CH340 MCU
echo "[3/4] Creating udev rule for CH340 MCU..."
cat << 'EOF' > /etc/udev/rules.d/99-second-mcu.rules
SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666"
EOF

# 4. Reload udev rules live
echo "[4/4] Reloading udev rules..."
udevadm control --reload-rules && udevadm trigger

echo "===================================================="
echo " Setup successfully restored!"
echo " Restart the printer now with: reboot"
echo "===================================================="
