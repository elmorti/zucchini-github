#!/bin/bash

APIV3="https://api.github.com"
TOKEN="${1}"
REPONAME="${2}"
REPODESCRIPTION="${3}"

POSTDATA=" 
{ \
    \"name\":\"${REPONAME}\", \
    \"description\":\"${REPODESCRIPTION}\", \
    \"private\": true \
} \
"

main () {
  if [ $# -lt 1 ]
  then
    usage
    exit 1 
  fi

  RESPONSE=$(curl -s -X POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: bearer $(cat ${TOKEN})" ${APIV3}/user/repos -d "${POSTDATA}")
  echo ${RESPONSE}
  exit 0
}

usage() {
  echo "Usage:"
  echo ""
  echo "${0} tokenfile"
  echo ""
}

main $@