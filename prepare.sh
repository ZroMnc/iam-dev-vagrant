#!/bin/sh
# Don't bother with apt-get update on every run, only if outdated (> 1 day)
if find /var/lib/apt/periodic/update-success-stamp -mtime +1 | grep update-success-stamp; then
  apt-get update
fi

