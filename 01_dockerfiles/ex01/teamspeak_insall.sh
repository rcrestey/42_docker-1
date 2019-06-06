# Update and install wget, bzip2 and sudo for get and extract teamspeak 
apt-get -y update && apt-get -y upgrade &&  apt-get -y install wget && apt-get install bzip2

#Go to /opt directory
cd /opt

# Download teamspeak server
wget http://dl.4players.de/ts/releases/3.6.1/teamspeak3-server_linux_amd64-3.6.1.tar.bz2

# Decompress
bzip2 -d teamspeak3-server_linux_amd64-3.6.1.tar.bz2
tar -xvf teamspeak3-server_linux_amd64-3.6.1.tar

# Remove archive
rm teamspeak3-server_linux_amd64-3.6.1.tar

# Go to teamspeak directory
cd teamspeak3-server_linux_amd64

# Agree the license
touch .ts3server_license_accepted

#Run the serer
sh ts3server_minimal_runscript.sh
