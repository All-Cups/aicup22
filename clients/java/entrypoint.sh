#!/usr/bin/env bash

PROJECT_NAME="ai-cup-22"
SOLUTION_CODE_ENTRYPOINT="src/main/java/ai_cup_22/MyStrategy.java"
function compile() (
    set -e
    mvn --offline package --batch-mode
)
COMPILED_FILE_PATH="$SOLUTION_CODE_PATH/target/$PROJECT_NAME-jar-with-dependencies.jar"
function run() (
    set -e
    java --enable-preview -Xmx$(expr $RAM_MB - 16)m -jar $MOUNT_POINT "$@"
)

function copy_solution() (
    set -e
    if [ "$ZIPPED" = True ]; then
        mkdir /tmp/preserved_files
        for file in $PRESERVE_FILES
        do
            mv $SOLUTION_CODE_PATH/$file /tmp/preserved_files/$file
        done
        rm -rf $SOLUTION_CODE_PATH/*
        for file in $PRESERVE_FILES
        do
            mv /tmp/preserved_files/$file $SOLUTION_CODE_PATH/$file
        done
        rmdir /tmp/preserved_files
        unzip $MOUNT_POINT -d $SOLUTION_CODE_PATH
    else
        cp $MOUNT_POINT $SOLUTION_CODE_PATH/$SOLUTION_CODE_ENTRYPOINT
    fi
)

if [ "$COMPILE" = True ]; then
    if [[ $(type -t compile) != function ]]; then
        echo "Not compilable!"
        exit 1
    fi
    if [ "$DIRECT_RUN" = True ]; then
        set -e
        compile
        mv $COMPILED_FILE_PATH $MOUNT_POINT
    else
        copy_solution
        COMPILATION_LOG="$(compile 2>&1)"
        if [ $? -ne 0 ]; then
            echo "{\"status\": \"error\",\"message\": `echo "$COMPILATION_LOG" | jq -aRs .`,\"path_to_compiled_file\": \"$FILE_PATH\"}" > $COMPILE_LOG_LOCATION
            SUCCESS=false
        else
            echo "{\"status\": \"ok\",\"message\": \"compilation done\",\"path_to_compiled_file\": \"$COMPILED_FILE_PATH\"}" > $COMPILE_LOG_LOCATION
            SUCCESS=true
        fi
        echo "$COMPILATION_LOG"
        echo "SUCCESS=$SUCCESS"
    fi
else
    if [[ $(type -t compile) != function ]] && [ -z $DIRECT_RUN ]; then
        copy_solution
    fi
    if [ -z $PORT ]; then
        PORT=3000
    fi
    run $WORLD_NAME $PORT $SECRET_TOKEN
fi
