#!/usr/bin/env bash


function git_sync() {
    local now=$(date --iso-8601=seconds)

    git diff --exit-code > /dev/null; if [ $? -ne 0 ]; then
        git commit -am "WIP - ${now}" > /dev/null; if [ $? -eq 0 ]; then
            git push -f 2> /dev/null && echo "Synced ${now}"
            git reset HEAD^ > /dev/null
        fi
    fi
}

while :
do
    inotifywait -rq -e modify .
    git_sync
done
