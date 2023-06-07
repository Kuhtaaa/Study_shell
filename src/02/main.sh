#!/bin/bash
source function.sh

hostname="HOSTNAME = $HOSTNAME"
echo $hostname

timezone=$(timedatectl | grep "Time zone")
TIMEZONE=$(echo "TIMEZONE = ${timezone:27}")
echo $TIMEZONE

USER=$(echo "USER = $(whoami)")
echo $USER

OS=$(echo "OS = $(uname -s -v)")
echo $OS

DATE="DATE = $(date +"%d %B %Y %T")"
echo $DATE

UPTIME="UPTIME = $(uptime -p)"
echo $UPTIME

uptime_sec="UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
echo $uptime_sec

IP=$(ip r | grep "default via ")
IP="IP = ${IP:12:9}"
echo $IP

MASK=$(route -n | grep "255.")
MASK="MASK = ${MASK:24:24}"
echo $MASK

GATEWAY=$(ip r | grep "default via ")
GATEWAY="GATEWAY = ${GATEWAY:12:9}"
echo $GATEWAY

RAM_FREE=$(awk '/MemFree/{print $2}' /proc/meminfo)
RAM_TOTAL=$(awk '/MemTotal/{print $2}' /proc/meminfo)

temp_result=$(echo "scale=3; $RAM_TOTAL/$divider" | bc)
RAM_TOTAL_PRINT=$(comparison $temp_result RAM_TOTAL)
echo $RAM_TOTAL_PRINT

temp_result=$(echo "scale=3; ($RAM_TOTAL-$RAM_FREE)/$divider" | bc)
RAM_USED_PRINT=$(comparison $temp_result RAM_USED)
echo $RAM_USED_PRINT

temp_result=$(echo "scale=3; $RAM_FREE/$divider" | bc)
RAM_FREE_PRINT=$(comparison $temp_result RAM_FREE)
echo $RAM_FREE_PRINT

CURRENT=$(df / | grep / | awk '{ print $2}')
SPACE_ROOT=$(space_root $CURRENT SPACE_ROOT)
echo $SPACE_ROOT

CURRENT=$(df / | grep / | awk '{ print $3}')
SPACE_ROOT_USED=$(space_root $CURRENT SPACE_ROOT_USED)
echo $SPACE_ROOT_USED

CURRENT=$(df / | grep / | awk '{ print $4}')
SPACE_ROOT_FREE=$(space_root $CURRENT SPACE_ROOT_FREE)
echo $SPACE_ROOT_FREE

echo "Are you whant write data in file? (Y / N)"
read Keypress

case "$Keypress" in
  [Yy]   ) save_text ;;
esac
