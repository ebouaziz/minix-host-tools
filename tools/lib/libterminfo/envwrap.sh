#!/bin/sh

TOOL_DIR="$1"
shift

if [ ! -d "${TOOL_DIR}" ]; then
    echo "Invalid tool directory: ${TOOL_DIR}" >&2
    exit  1
fi

export TOOL_AWK=`which awk`
export TOOL_SED=`which sed`
export TOOL_NBPERF="${TOOL_DIR}/nbperf"

if [ ! -x "${TOOL_NBPERF}" ]; then
    echo "Invalid tool: ${TOOL_NBPERF}" >&2
    exit  1
fi

CMD="$1"
shift

${CMD} $@
