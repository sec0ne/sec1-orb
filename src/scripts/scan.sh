#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
SEC1_INTEGRATION_NAME=$(circleci env subst "${SEC1_INTEGRATION_NAME}")
PARAM_SEC1_API_KEY=$(circleci env subst "${PARAM_SEC1_API_KEY}")
# If for any reason the TO variable is not set, default to "World"
#echo "Hello ${TO:-World}!"
echo "hello world sec1 foss security"
curl -k https://storage.cloud.google.com/sec1-shared-assets/sec1-cli-linux -o /tmp/sec1-cli
cd /home/circeci/project
echo "Initiating scan in directory: $SCAN_DIRECTORY"
/tmp/sec1-cli scan -s circleci --apiKey "${PARAM_SEC1_API_KEY}"
docker pull sec1security/sec1-foss-security:v1
ls -latr /home/circleci/project
docker run -e SEC1_INTEGRATION_NAME="${SEC1_INTEGRATION_NAME}" -e INPUT_APIKEY="${PARAM_SEC1_API_KEY}" -v /home/circleci/project:/app/circleci-workspace -it --rm sec1security/sec1-foss-security:v1
