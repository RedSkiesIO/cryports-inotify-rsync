#!/bin/bash

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete /home/gitlab-runner/artifacts
  rsync --delete -og --chown=www-data:www-data -avzP /home/gitlab-runner/artifacts/* gitlab@cryports.atlas:/srv/
done
