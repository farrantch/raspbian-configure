# Update Apt
apt update

# Install packages
apt install git lsb-release p7zip-full firefox-esr -y

# Disable Screensaver
grep -qxF '@xset s noblank' /etc/xdg/lxsession/LXDE-pi/autostart || echo '@xset s noblank' >> /etc/xdg/lxsession/LXDE-pi/autostart
grep -qxF '@xset s off' /etc/xdg/lxsession/LXDE-pi/autostart || echo '@xset s off' >> /etc/xdg/lxsession/LXDE-pi/autostart            
grep -qxF '@xset -dpms' /etc/xdg/lxsession/LXDE-pi/autostart || echo '@xset -dpms' >> /etc/xdg/lxsession/LXDE-pi/autostart

# Boot To CLI and Disable Auto-Login
raspi-config nonint do_boot_behaviour B1
# Set GPU memory
raspi-config nonint do_memory_split 256

# Install RetroPie
mkdir /opt/retropie/
cd /opt/retropie/
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
chmod +x retropie_setup.sh
bash ./retropie_setup.sh

# Restart
echo 'Restarting in 10 seconds...'
sleep 10
shutdown -r now
