#!/bin/bash
set -e

rm -f /dogwalkers/tmp/pids/server.pid

exec "$@"