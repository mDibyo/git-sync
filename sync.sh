#!/usr/bin/env bash


github_sync() {
    local now=$(date --iso-8601=seconds)

    git diff --exit-code > /dev/null; if [ $? -ne 0 ]; then
        git commit -am "WIP - ${now}"; if [ $? -eq 0 ]; then
            git push -f
            git reset HEAD^
        fi
    fi
}

while :
do
    inotifywait -r -e modify .
    github_sync
done