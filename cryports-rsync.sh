#!/bin/bash

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete /opt/syncfiles
  rsync -avz -e "ssh -i /root/rsync-key -o StrictHostKeyChecking=no“  /opt/syncfiles/ root@rsync-host02:/opt/syncfiles/
done