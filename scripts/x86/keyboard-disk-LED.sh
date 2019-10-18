#!/bin/bash
#
# Remap keyboard LEDs as disk activity indication
# NOTE: Must be ran as root, preferably with cron

# Check interval seconds
CHECKINTERVAL=0.2

# console
CONSOLE=/dev/console

#indicator to use [caps, num, scroll]
INDICATOR=scroll

getVmstat() {
  cat /proc/vmstat|egrep "pgpgin|pgpgout"
}
#turn led on
function led_on()
{
    setleds -L +${INDICATOR} < ${CONSOLE}
}
#turn led off
function led_off()
{
    setleds -L -${INDICATOR} < ${CONSOLE}
}
# initialise variables
NEW=$(getVmstat)
OLD=$(getVmstat)
##
while [ 1 ] ; do
  sleep $CHECKINTERVAL # slowdown a bit
  # get status
  NEW=$(getVmstat)
  #compare state
  if [ "$NEW" = "$OLD" ]; then
    led_off ## no change, led off
  else
    led_on  ## change, led on
  fi
  OLD=$NEW
done
