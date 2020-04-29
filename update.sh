#!/bin/bash
#FreeDNS updater script

UPDATEURL="http://freedns.afraid.org/dynamic/update.php?T3Z4NXcxaUJqdnYyV0I5cWtHMzhCMjdPOjE4OTA2NDgx"
DOMAIN="paranutti.mooo.com"

registered=$(nslookup $DOMAIN|tail -n2|grep A|sed s/[^0-9.]//g)

  current=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)
       [ "$current" != "$registered" ] && {                           
          wget -q -O /dev/null "$UPDATEURL"
          echo "DNS updated on:"; date
  }
