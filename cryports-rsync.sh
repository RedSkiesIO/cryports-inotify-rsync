#!/bin/bash

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete ${ARTIFACTS_DIR}
  rsync -avz -e "ssh -i /home/gitlab-runner/.ssh/id_rsa.pub -o StrictHostKeyChecking=no“ ${ARTIFACTS_DIR} gitlab@cryports.atlas:/srv/
done