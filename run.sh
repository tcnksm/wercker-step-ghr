#!/bin/bash

# Environmental variables for tcnksm/ghr (passed from wercker.yml)
VERSION="$WERCKER_GHR_VERSION"
OWNER="$WERCKER_GHR_OWNER"
GITHUB_TOKEN="$WERCKER_GHR_TOKEN"
PRE_RELEASE="$WERCKER_GHR_PRE_RELEASE"
REPLACE="$WERCKER_GHR_REPLACE"
INPUT="$WERCKER_GHR_INPUT"
OPT="$WERCKER_GHR_OPT"

# Check and Set Default value
if [ -z "${GITHUB_TOKEN}" ]; then
    fail "Please set your Github token."
fi

if [ "${PRE_RELEASE}" = "true" ]; then
    OPT="${OPT} --prerelease"
fi 

if [ "${REPLACE}" = "true" ]; then
    OPT="${OPT} --delete"
fi 

# If not version is not supplied,
# we use `pre-release` tag and relase as prelesease on Github Release
if [ -z "${VERSION}" ]; then
    info "no version was supplied; using pre-release as version"
    VERSION="pre-release"
    OPT="${OPT} --prerelease"
fi

OWNER=${OWNER:-$WERCKER_GIT_OWNER}

$WERCKER_STEP_ROOT/bin/ghr -v

$WERCKER_STEP_ROOT/bin/ghr \
    -t ${GITHUB_TOKEN} \
    -r ${WERCKER_GIT_REPOSITORY} \
    -u ${OWNER} \
    ${OPT} \
    ${VERSION} ${INPUT}
