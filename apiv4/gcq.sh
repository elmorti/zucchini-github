#!/bin/bash

APIV4="https://api.github.com/graphql"
APIV3=""
TOKEN="${1}"

QUERY="
{ \
  \"query\": \"$(cat getsecuritystuff.query | sed s/\"/\\\\\"/g | tr -s '\n' ' ')\" \
} \
"
main () {
  if [ $# -lt 1 ]
  then
    usage
    exit 1 
  fi
  RESPONSE=$(curl -s -H "Authorization: bearer $(cat ${TOKEN})" -X POST -d "${QUERY}" ${APIV4})
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