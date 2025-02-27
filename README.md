# cryports-inotify-rsync

This script runs as a service on the gitlab server it uses inotify to see when new files are added to the $ARTIFACTS_DIR (these are outputs from build pipelines) then runs a rsync command to send the arifacts to the cryports webserver.

# Install Instructions

1) clone repo to the home of the gitlab-runner (simply because the users keys are synced to the cryport webserver)

    $ git clone git@gitlab.engr.atlas:cryptos/cryports-inotify-rsync.git
    
2) make the cryport-rsync.sh file executable

    $ cp cryport-rsync.s /usr/local/bin/cryport-rsync
    $ chmod u+x /usr/local/bin/cryport-rsync 

2) install inotify deps with 

    $ apt-get install inotify-tools -y

3) copy the cryport-sync.service to /etc/systemd/system/

    $ cp cryport-sync.service /lib/systemd/system/

4) reload systemd and start the service

    $ systemctl daemonm-reload
    $ systemctl start cryport-sync.service
