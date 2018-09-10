#!/bin/bash

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete ${ARTIFACTS_DIR}
  rsync -og --chown=www-data:www-data -avzP ${ARTIFACTS_DIR}/* gitlab@cryports.atlas:/srv/
done