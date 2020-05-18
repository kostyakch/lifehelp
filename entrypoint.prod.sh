#!/bin/sh
set -e

if [ -f /usr/src/app/tmp/pids/server.pid ]; then
  rm /usr/src/app/tmp/pids/server.pid
fi

# bundle exec rake db:migrate 2>/dev/null
# bundle exec rake tmp:cache:clear 2>/dev/null
# bundle exec rake assets:precompile 2>/dev/null

exec "$@"
