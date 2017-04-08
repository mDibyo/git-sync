#!/usr/bin/env bash


github_sync() {
    local now=$(date --iso-8601=seconds)
    git commit -am "WIP - ${now}"
    rc=$?; if [[ ${rc} == 0 ]]; then
        git push -f
        git reset HEAD^
    fi
}

while :
do
    inotifywait -r -e modify .
    github_sync
done