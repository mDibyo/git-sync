#!/usr/bin/env bash


github_sync() {
    local now=$(date --iso-8601=seconds)
    git add -u
    git commit -m "WIP - ${now}"
    rc=$?; if [[ ${rc} == 0 ]]; then
        git push -f
        git reset --soft HEAD^
    fi
}

while :
do
    inotifywait -r -e modify .
    github_sync
done