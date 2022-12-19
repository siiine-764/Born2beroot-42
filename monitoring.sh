#!/bin/bash

usedMem=$(free -m | grep Mem: | awk '{printf("%d/%dMB", $3, $2)}')
pMem=$(free -m | grep Mem: | awk '{printf("%.2f",$3/$2*100)}')
diskUs=$(df -hm --total | grep total | awk '{print $3}')
diskTa=$(df -h --total | grep total | awk '{printf("%dGb", $2)}')
pDisk=$(df -h --total | grep total | awk '{print $5}')
LVMS=$(lsblk | grep "LVM" | wc -l)
wall "
	#Architecture: $(uname -a)
	#CPU physical: $(grep "physical id" /proc/cpuinfo | wc -l)
	#vCPU: $(grep "^processor" /proc/cpuinfo | wc -l)
	#Memory Usage: $usedMem ($pMem%)
	#Disk Usage: $diskUs/$diskTa ($pDisk)
	#CPU load: $(top -bn1 | grep '^%Cpu' | awk -F, '{printf("%.1f%%", 100 - $4)}')
	#Last boot: $(who -b | awk '{printf("%s %s", $3, $4)}')
	#LVM use: $(if [[$LVMS -eq 0]]; then echo no; else echo yes;fi)
	#Connections TCP: $(netstat -at | grep "4242" | grep ESTABLISHED | wc -l) ESTABLISHED
	#User log: $(who | awk '{print $1}' | uniq | wc -l)
	#Network: IP $(hostname -I)($(ip a | grep "ether" | awk '{printf($2)}'))
	#Sudo: $(journalctl -q _COMM=sudo | grep COMMAND | wc -l) cmd
	"
