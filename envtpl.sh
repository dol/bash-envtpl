#!/usr/bin/env bash

function envtpl() {
    local PREFIX=$1
    local TARGET=$2
    local DELIMITER=${3:-_}
    local DELIMITER_REPLACEMENT=${4:--}

    while IFS= read -r KEY_NAME; do
        KEY=${KEY_NAME#"${PREFIX}"}
        KEY=$(echo "${KEY,,}" | tr "${DELIMITER}" "${DELIMITER_REPLACEMENT}")
        echo "${KEY}=${!KEY_NAME}" >> "${TARGET}"
    done < <(compgen -v "${PREFIX}")
}
