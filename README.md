# cryports-inotify-rsync

This script runs as a service on the gitlab server it uses inotify to see when new files are added to the $ARTIFACTS_DIR (these are outputs from build pipelines) then runs a rsync command to send the arifacts to the cryports webserver