#!/bin/sh
set -e

if [ -f /usr/src/app/tmp/pids/server.pid ]; then
  rm /usr/src/app/tmp/pids/server.pid
fi

# Start/restart ssh-agent and add your key to it
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

exec "$@"
