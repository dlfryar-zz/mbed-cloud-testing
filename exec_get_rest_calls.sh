#!/bin/bash

BEAUTIFY_JSON_CMD="python -m json.tool"
CURL_OPTS="-sS"

if [ "$1" = "-v" ]; then
    # echo "Going verbose!"
    CURL_OPTS="-v I"
elif [ "$1" = "-h" ]; then
    echo "Command options are none, -h, and -v"
    echo""
    exit 0;
fi

CURL_CMD="curl ${CURL_OPTS}"

MBED_CLOUD_API_KEY=$(cat api.key  | grep MBED_CLOUD_API_KEY | cut -d '=' -f 2 | tr -d '"')
MBED_CLOUD_API_ENDPOINT=$(cat api.key  | grep MBED_CLOUD_API_ENDPOINT | cut -d '=' -f 2 | tr -d '"' | sed 's/\/$//')

# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v2/endpoints" | python -m json.tool
${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/devices" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/device-queries" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v2/notification/callback" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v2/notification/pull" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v2/subscriptions" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/accounts/me" | python -m json.tool
# Note the last 32 bytes is truncated so save the initial key
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/api-keys" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/policy-groups" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/users" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/users/me"
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/developer-certificate" | python -m json.tool
# ${CURL_CMD} -H 'Authorization: Bearer '${MBED_CLOUD_API_KEY}'' ${MBED_CLOUD_API_ENDPOINT}"/v3/production-line-certificates" | python -m json.tool
