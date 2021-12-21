free --mega | grep "Mem" | awk '{printf "%d/%dMB ", $3, $2} {printf "(%.2f%%)", $3/$2*100}'

df -BMB | awk '{U += $3} '{A += $2}{U += $3} END {printf "%.1f\n", U/1024}
df -BMB | awk '{U += $3}{A += $2} END {printf "%.1f/%.1fGb (%d%%)\n", U/1024, A/1024, U/A*100}'

//проверка задач	top
//вывести задачи	top -bn1
//доп.утилита		sudo apt install sysstat
//проверка задач	mpstat
mpstat | grep "all" | awk '{print 100-$13"%"}'
//who -b (time of last system boot)
who -b | awk '{print $3" "$4}'

lsblk | grep "lvm" | awk '{if ($6 == "lvm") {print "yes";exit} else {print "no";exit} }'

cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3 "ESTABLISHED"}'
cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3 "ESTABLISHED"}' /proc/net/sockstat{,6}
grep "TCP" /proc/net/sockstat{,6} | awk '{print $3 "ESTABLISHED"}'
grep "TCP:" /proc/net/sockstat{,6} | awk '{print $3 " ESTABLISHED"}'

who | wc -l

hostname -I
ip link show | grep "link/ether" | awk '{print $2}'

// просмотр команд которые использовались при помощи SUDO
// journalctl _COMM=sudo -g COMMAND
journalctl _COMM=sudo -g COMMAND -q | wc -l
