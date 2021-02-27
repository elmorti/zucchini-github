#!/bin/bash

# Adds a deployment key to the repository.

main () {
  if [ $# -lt 1 ]
  then
    usage
    exit 1 
  fi

  REPONAME=${2}
  RESPONSE=$(curl -s -H "Accept: application/vnd.github.v3+json" -H "Authorization: bearer $(cat ${TOKEN})" ${APIV3}/repos/${REPONAME}/keys -d "${PAYLOAD}")
  echo ${RESPONSE}
  exit 0
}
 
usage() {
  echo "Usage:"
  echo ""
  echo "${0} configfile reponame"
  echo ""
}

if [ ! -f ${1} ]
then
  echo "Needs a config file."
  exit 1
fi

source ./${1}
main $@
