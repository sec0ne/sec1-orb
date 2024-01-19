#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
SEC1_INTEGRATION_NAME=$(circleci env subst "${SEC1_INTEGRATION_NAME}")
PARAM_SEC1_API_KEY=$(circleci env subst "${PARAM_SEC1_API_KEY}")
# If for any reason the TO variable is not set, default to "World"
#echo "Hello ${TO:-World}!"
echo "hello world sec1 foss security"
curl -k https://storage.googleapis.com/sec1-shared-assets/sec1-cli-linux -o /tmp/sec1-cli
chmod 755 /tmp/sec1-cli
ls -latr /tmp
cd /home/circleci/project || exit 1
echo "Initiating scan in directory: /home/circleci/project"
ls -latr /home/circleci/project
/tmp/sec1-cli scan -s circleci --apiKey "${PARAM_SEC1_API_KEY}"
#docker pull sec1security/sec1-foss-security:v1
#ls -latr /home/circleci/project
#docker run -e SEC1_INTEGRATION_NAME="${SEC1_INTEGRATION_NAME}" -e INPUT_APIKEY="${PARAM_SEC1_API_KEY}" -v /home/circleci/project:/app/circleci-workspace -it --rm sec1security/sec1-foss-security:v1
