echo "#Architecture: `uname -a`"
echo "#CPU physical: `grep "physical id" /proc/cpuinfo | wc -l`"
echo "#vCPU: `grep "processor" /proc/cpuinfo | wc -l`"
echo "#Memory Usage: `free --mega | grep "Mem" | awk '{printf "%d/%dMB ", $3, $2} {printf "(%.2f%%)", $3/$2*100}'`"
echo "#Disk Usage: `df -BMB | awk '{U += $3}{A += $2} END {printf "%.1f/%.1fGb (%d%%)\n", U/1024, A/1024, U/A*100}'`"
echo "#CPU load: `mpstat | grep "all" | awk '{print 100-$13"%"}'`"
echo "#Last boot: `who -b | awk '{print $3" "$4}'`"
echo "#LVM use: `lsblk | grep "lvm" | awk '{if ($6 == "lvm") {print "yes";exit} else {print "no";exit} }'`"
echo "#Connections TCP: `grep "TCP:" /proc/net/sockstat | awk '{print $3 " ESTABLISHED"}'`"
echo "#User log: `who | wc -l`"
echo "#Network: IP `hostname -I` (`ip link show | grep "link/ether" | awk '{print $2}'`)"
echo "#Sudo: `journalctl _COMM=sudo -g COMMAND -q | wc -l` cmd"

wall "
	#Architecture: `uname -a`
	#CPU physical: `grep "physical id" /proc/cpuinfo | wc -l`
	#vCPU: `grep "processor" /proc/cpuinfo | wc -l`
	#Memory Usage: `free --mega | grep "Mem" | awk '{printf "%d/%dMB ", $3, $2} {printf "(%.2f%%)", $3/$2*100}'`
	#Disk Usage: `df -BMB | awk '{U += $3}{A += $2} END {printf "%.1f/%.1fGb (%d%%)\n", U/1024, A/1024, U/A*100}'`
	#CPU load: `mpstat | grep "all" | awk '{print 100-$13"%"}'`
	#Last boot: `who -b | awk '{print $3" "$4}'`
	#LVM use: `lsblk | grep "lvm" | awk '{if ($6 == "lvm") {print "yes";exit} else {print "no";exit} }'`
	#Connections TCP: `grep "TCP:" /proc/net/sockstat | awk '{print $3 " ESTABLISHED"}'`
	#User log: `who | wc -l`
	#Network: IP `hostname -I` (`ip link show | grep "link/ether" | awk '{print $2}'`)
	#Sudo: `journalctl _COMM=sudo -g COMMAND -q | wc -l` cmd
"


