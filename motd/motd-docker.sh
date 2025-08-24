#!/bin/bash

# beauty ssh welcome message
# original by reloxx13/reloxx13.github.io
# modified by e1ghts1x
# required: sudo apt-get install update-notifier-common

export TERM=xterm-256color

CPUTempM=$(sensors | awk '/Tctl/ {gsub("\\+|°C",""); print $2}')

# Basic info
Hostname=`uname -n`
Root1=`df -hBM / | awk '/\// {print $(NF-3)"B"}'`
Root2=`df -hBM / | awk '/\// {print $(NF-4)"B"}'`

# System load
Memory1=`free -t -m | grep Total | awk '{print $3"MB";}'`
Memory2=`free -t -m | grep "Mem" | awk '{print $2"MB";}'`

# UpTime calculator
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UpTime=`printf "%d Tage, %02d:%02d:%02dh" "$days" "$hours" "$mins" "$secs"`

# IP adresses
IP=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'`

# Model
Model=`echo "$(cat /sys/class/dmi/id/board_name)"`

echo "$(tput setaf 12)
                    ##        .       
              ## ## ##       ==            
           ## ## ## ##      ===$(tput setaf 12)                    > Hostname ..... $Hostname$(tput setaf 12)
       /##################\___/ ===$(tput setaf 12)                > IP-Address ... $IP$(tput setaf 12)
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~$(tput setaf 12)           > Uptime ....... $UpTime$(tput setaf 12)
       \______ o          __/$(tput setaf 12)                      > CPU-Temp ..... $CPUTempM°C$(tput setaf 12)
         \    \        __/$(tput setaf 12)                         > Disk Usage ... $Root1 / $Root2$(tput setaf 12)
          \____\______/$(tput setaf 12)                            > Memory ....... $Memory1 / $Memory2$(tput setaf 12)
 
          |          |
       __ |  __   __ | _  __   _
      /  \| /  \ /   |/  / _\ | 
      \__/| \__/ \__ |\_ \__  |$(tput setaf 12) 

$Model
`uname -srmo`
`date +"%A, %e %B %Y, %H:%M:%S"`
$(tput sgr0)"

# sudo mkdir /opt/motd
# sudo curl -o /opt/motd/motd.sh [path to .sh script from my repository]
# sudo chmod +x /opt/motd/motd.sh
# sudo ln -s /opt/motd/motd.sh /etc/update-motd.d/11-raspberry-welcome-message
# sudo chmod -x /etc/update-motd.d/10-uname
# sudo mv /etc/motd /etc/motd.backup
# apt install lm-sensors