#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
SEC1_INTEGRATION_NAME=$(circleci env subst "${SEC1_INTEGRATION_NAME}")
PARAM_SEC1_API_KEY=$(circleci env subst "${PARAM_SEC1_API_KEY}")
INPUT_SCANTHRESHOLD=$(circleci env subst "${PARAM_SCAN_THRESHOLD}")
# If for any reason the TO variable is not set, default to "World"
#echo "Hello ${TO:-World}!"
echo "Running Sec1 Security"
echo "Installing Sec1 Cli"
curl -k https://storage.googleapis.com/sec1-shared-assets/sec1-cli-linux -o /tmp/sec1-cli
chmod 755 /tmp/sec1-cli
ls -latr /tmp
echo "Initiating scan in directory: /home/circleci/project"
cd /home/circleci/project || exit 1

THRESHOLD_ARG=""

if [ -n "$INPUT_SCANTHRESHOLD" ]; then
  ls -latr /home/circleci/project
  /tmp/sec1-cli scan -s cli --apiKey "${PARAM_SEC1_API_KEY}" -th "${INPUT_SCANTHRESHOLD}"
else
  ls -latr /home/circleci/project
  /tmp/sec1-cli scan -s cli --apiKey "${PARAM_SEC1_API_KEY}"
fi

#docker pull sec1security/sec1-foss-security:v1
#ls -latr /home/circleci/project
#docker run -e SEC1_INTEGRATION_NAME="${SEC1_INTEGRATION_NAME}" -e INPUT_APIKEY="${PARAM_SEC1_API_KEY}" -v /home/circleci/project:/app/circleci-workspace -it --rm sec1security/sec1-foss-security:v1
