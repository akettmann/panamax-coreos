#!/bin/sh

# Test if the system has virtualization
if [[ "$(egrep -c svm\|vmx /proc/cpuinfo)" -gt "0" ]]
	then
		echo "Virtualization detected. Proceeding"
	else 
		echo "No Virtualization options detected!"
		echo "Panamax requires virtualization options to function. Please attempt on a machine with VT-x or AMD-V available."
		exit 1
fi 

installer='panamax-latest.tar.gz'
destination=~/.panamax
curl -O "http://download.panamax.io/installer/$installer"
mkdir -p ${destination} && tar -C ${destination} -zxvf ${installer}
sudo ln -sf ~/.panamax/panamax /usr/local/bin/panamax
curl -O http://download.panamax.io/panamaxcli/panamaxcli-linux
sudo mv panamaxcli-linux /usr/local/bin/pmxcli && chmod 755 /usr/local/bin/pmxcli
panamax init
#echo "Execute panamax and select to continue."
