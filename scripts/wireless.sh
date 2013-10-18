#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`/sbin/iwconfig wlan0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`/sbin/iwconfig wlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 20`
case $bars in
  0)  bar='[     ]' ;;
  1)  bar='[I    ]' ;;
  2)  bar='[II   ]' ;;
  3)  bar='[III  ]' ;;
  4)  bar='[IIII ]' ;;
  5)  bar='[IIIII]' ;;
  *)  bar='[  !! ]' ;;
esac

echo $essid $bar

exit 0
