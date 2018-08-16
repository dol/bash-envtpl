#!/usr/bin/env bash

function envtpl() {
    local PREFIX=$1
    local TARGET=$2
    local KEY_DELIMITER=${3:-_}
    local KEY_DELIMITER_REPLACEMENT=${4:--}
    local VALUE_DELIMITER=${5:-=}

    while IFS= read -r KEY_NAME; do
        KEY=${KEY_NAME#"${PREFIX}"}
        KEY=$(echo "${KEY,,}" | tr "${KEY_DELIMITER}" "${KEY_DELIMITER_REPLACEMENT}")
        echo "${KEY}${VALUE_DELIMITER}${!KEY_NAME}" >> "${TARGET}"
    done < <(compgen -v "${PREFIX}")
}
