#!/bin/bash
source function.sh

if [ $# != 4 ] ; then
  echo Неверное количество параметров
  exit 1
else 
  check_dublicate $1 $2 $3 $4
  back_color_first=$(set_color $1 1)
  text_color_first=$(set_color $2 2)
  back_color_second=$(set_color $3 1)
  text_color_second=$(set_color $4 2)
  first_part_color="\033[${text_color_first};${back_color_first}m"
  second_part_color="\033[${text_color_second};${back_color_second}m"
  defaul_color="\033[0m"
fi

hostname="HOSTNAME = "
echo -e "$first_part_color"$hostname"$second_part_color"$HOSTNAME"$defaul_color"

timezone=$(timedatectl | grep "Time zone")
TIMEZONE=$(echo "TIMEZONE = ")
timezone=${timezone:27}
echo -e "$first_part_color"$TIMEZONE"$second_part_color"$timezone"$defaul_color"

USER=$(echo "USER = ")
user=$(whoami)
echo -e "$first_part_color"$USER"$second_part_color"$user"$defaul_color"

OS=$(uname -s -v)
os="OS ="
echo -e "$first_part_color"$os"$second_part_color"$OS"$defaul_color"

DATE="$(date +"%d %B %Y %T")"
date="DATE = "
echo -e "$first_part_color"$date"$second_part_color"$DATE"$defaul_color"

UPTIME="$(uptime -p)"
uptime="UPTIME = "
echo -e "$first_part_color"$uptime"$second_part_color"$UPTIME"$defaul_color"

UPTIME_SEC="UPTIME_SEC = "
uptime_sec="$(awk '{print $1}' /proc/uptime)"
echo -e "$first_part_color"$UPTIME_SEC"$second_part_color"$uptime_sec"$defaul_color"

IP=$(ip r | grep "default via ")
IP="${IP:12:9}"
ip="IP ="
echo -e "$first_part_color"$ip"$second_part_color"$IP"$defaul_color"

MASK=$(route -n | grep "255.")
MASK="${MASK:24:24}"
mask="MASK ="
echo -e "$first_part_color"mask"$second_part_color"$MASK"$defaul_color"

GATEWAY=$(ip r | grep "default via ")
GATEWAY="${GATEWAY:12:9}"
gateway="GATEWAY ="
echo -e "$first_part_color"$gateway"$second_part_color"$GATEWAY"$defaul_color"

RAM_FREE=$(awk '/MemFree/{print $2}' /proc/meminfo)
RAM_TOTAL=$(awk '/MemTotal/{print $2}' /proc/meminfo)

temp_result=$(echo "scale=3; $RAM_TOTAL/$divider" | bc)
RAM_TOTAL_PRINT=$(comparison $temp_result)
ram_total="RAM_TOTAL ="
echo -e "$first_part_color"$ram_total"$second_part_color"$RAM_TOTAL_PRINT"$defaul_color"

temp_result=$(echo "scale=3; ($RAM_TOTAL-$RAM_FREE)/$divider" | bc)
RAM_USED_PRINT=$(comparison $temp_result)
ram_used="RAM_USED ="
echo -e "$first_part_color"$ram_used"$second_part_color"$RAM_USED_PRINT"$defaul_color"

temp_result=$(echo "scale=3; $RAM_FREE/$divider" | bc)
RAM_FREE_PRINT=$(comparison $temp_result)
ram_free="RAM_FREE ="
echo -e "$first_part_color"$ram_free"$second_part_color"$RAM_FREE_PRINT"$defaul_color"

CURRENT=$(df / | grep / | awk '{ print $2}')
SPACE_ROOT=$(space_root $CURRENT)
space_root="SPACE_ROOT ="
echo -e "$first_part_color"$space_root"$second_part_color"$SPACE_ROOT"$defaul_color"

CURRENT=$(df / | grep / | awk '{ print $3}')
SPACE_ROOT_USED=$(space_root $CURRENT)
space_root_used="SPACE_ROOT_USED ="
echo -e "$first_part_color"$space_root_used"$second_part_color"$SPACE_ROOT_USED"$defaul_color"

CURRENT=$(df / | grep / | awk '{ print $4}')
SPACE_ROOT_FREE=$(space_root $CURRENT)
space_root_free="SPACE_ROOT_FREE ="
echo -e "$first_part_color"$space_root_free"$second_part_color"$SPACE_ROOT_FREE"$defaul_color"
