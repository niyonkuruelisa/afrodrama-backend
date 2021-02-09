#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /api/tmp/pids/server.pid ]; then
  rm /api/tmp/pids/server.pid
fi
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup db:seed
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"