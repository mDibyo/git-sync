#!/usr/bin/env bash


function git_sync {
    local now=$(date --iso-8601=seconds)

    git diff --exit-code > /dev/null; if [ $? -ne 0 ]; then
        git commit -am "WIP - ${now}" > /dev/null; if [ $? -eq 0 ]; then
            git push -f 2> /dev/null && echo "Synced ${now}" || exit $?
            git reset HEAD^ > /dev/null
        fi
    fi
}

function unsync {
    echo "Unsyncing..."
    git push -f 2> /dev/null
}

function main {
    trap unsync SIGHUP SIGINT SIGTERM
    git_sync || exit $?
    while :; do
        inotifywait -rq --exclude \.git --event modify . || exit $?
        git_sync || exit $?
    done
}


main
