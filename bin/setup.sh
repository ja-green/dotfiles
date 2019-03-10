#!/bin/sh

echo "READ THE SOURCE BEFORE RUNNING!"
exit 1

if [[ $UID -ne 0 ]]; then
echo "This script needs to be run as root (with sudo)"
exit 1
fi

echo "If you are not using the default internet repositories you should configure this before running this script."
echo "You should also have an active network connection to the repositories."
read -p "Continue? [y/n]: " CONFIRM
if [ "$CONFIRM" != "y" ]; then
exit
fi

echo -e "\n\nApplying recommended system settings...\n"

# Enable automatic updates
echo "APT::Periodic::Update-Package-Lists \"1\";
APT::Periodic::Unattended-Upgrade \"1\";
APT::Periodic::AutocleanInterval \"7\";
" >> /etc/apt/apt.conf.d/20auto-upgrades

chmod 644 /etc/apt/apt.conf.d/20auto-upgrades

# Disable apport (error reporting)
sed -ie '/^enabled=1$/ s/1/0/' /etc/default/apport

# Disable guest login
mkdir /etc/lightdm/lightdm.conf.d
echo "[SeatDefaults] allow-guest=false" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf

# A hook to disable online scopes in dash on login
echo '#!/bin/bash' > /usr/local/bin/unity-privacy-hook.sh
echo "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set com.canonical.Unity.Lenses disabled-scopes \"['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']\"
for USER in \`ls -1 /home\`; do
chown \"\$USER\":\"\$USER\" /home/\"\$USER\"/.*
done
exit 0
" >> /usr/local/bin/unity-privacy-hook.sh
chmod 755 /usr/local/bin/unity-privacy-hook.sh
echo "[SeatDefaults]
session-setup-script=/usr/local/bin/unity-privacy-hook.sh" > /etc/lightdm/lightdm.conf.d/20privacy-hook.conf

# Refresh the package list
apt update

# Configure a basic IPv4 firewall
echo "*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
COMMIT" > /etc/iptables/rules.v4

# Configure a basic IPv6 firewall
echo "*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 134 -j ACCEPT
-A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 135 -j ACCEPT
-A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 136 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
COMMIT" > /etc/iptables/rules.v6

# Load theuser-db:user system-db:local new iptable rules
netfilter-persistent reload

# Set some AppArmor profiles to enforce mode
aa-enforce /etc/apparmor.d/usr.bin.firefox
aa-enforce /etc/apparmor.d/usr.sbin.avahi-daemon
aa-enforce /etc/apparmor.d/usr.sbin.dnsmasq
aa-enforce /etc/apparmor.d/bin.ping
aa-enforce /etc/apparmor.d/usr.sbin.rsyslogd

# Turn off privacy-leaking aspects of Unity
echo "user-db:user" > /etc/dconf/profile/user
echo "system-db:local" >> /etc/dconf/profile/user
mkdir -p /etc/dconf/db/local.d
echo "[com/canonical/unity/lenses]" > /etc/dconf/db/local.d/unity
echo "remote-content-search=false" >> /etc/dconf/db/local.d/unity
mkdir -p /etc/dconf/db/local.d/locks
echo "/com/canonical/unity/lenses/remote-content-search" > /etc/dconf/db/local.d/locks/unity
dconf update

# Make developer directory
mkdir -p ~/Applications/hmrc-development-environment/hmrc
echo 'export WORKSPACE=~/Applications/hmrc-development-environment/hmrc/' >> ~/.bashrc

# Upgrade the system
apt-get dist-upgrade -y

# Update repos
apt-get update

# Install OpenVPN network manager
sudo apt-get -y install network-manager-openvpn network-manager-openvpn-gnome

# Install build tools
sudo apt-get -y install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip curl wget

# Add additional keys
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update

# Install Java 8
sudo apt-get -y install oracle-java8-installer
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> ~/.bashrc

#Install Entropy Daemon
sudo apt-get install haveged

# Install Git
sudo apt-get -y install git

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo touch /etc/systemd/system/mongodb.service

echo " 
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" >> ~/etc/systemd/system/mongodb.service

sudo apt-get install mongodb-org=3.2.11 mongodb-org-server=3.2.11 mongodb-org-shell=3.2.11 mongodb-org-mongos=3.2.11 mongodb-org-tools=3.2.11
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Scala
curl -LOk www.scala-lang.org/files/archive/scala-2.11.7.deb
sudo dpkg -i scala-2.11.7.deb
rm scala-2.11.7.deb

# Install SBT
curl -LOk http://dl.bintray.com/sbt/debian/sbt-0.13.8.deb
sudo dpkg -i sbt-0.13.8.deb
rm sbt-0.13.8.deb

# Install ClamAV
sudo apt-get install clamav
sudo apt-get install clamav-daemon

# Set up a daily scan for ClamAV
sudo touch root/clamscan_daily.sh
echo "#!/bin/bash
DIRTOSCAN=\"/etc /home /tmp /usr\";

for S in ${DIRTOSCAN}; do
  clamscan -ri;
done

exit 0" >> root/clamscan_daily.sh

chmod +x root/clamscan_daily.sh
chmod 0755 root/clamscan_daily.sh

ln /root/clamscan_daily.sh /etc/cron.daily/clamscan_daily

# Install Google Chrome
# This command is run before the installation of chrome as it can be missing packages
sudo apt-get -f install libappindicator1

curl -LOk https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install IntelliJ via Ubuntu Make to get the latest release
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make 
sudo apt-get update
sudo apt-get install ubuntu-make
umake ide idea

# Install virtual box
sudo apt-get install virtualbox 

# Install atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom

# Install postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

sudo apt-get autoremove

echo -e "\nPOST INSTALLATION COMPLETE"

read -p "Reboot now? [y/n]: " CONFIRM
if [ "$CONFIRM" = "y" ]; then
reboot
fi

