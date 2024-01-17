#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
GITHUB_REPOSITORY=$(circleci env subst "${PARAM_GITHUB_REPOSITORY}")
# If for any reason the TO variable is not set, default to "World"
#echo "Hello ${TO:-World}!"
echo "hello world sec1 foss security"
docker pull sec1security/sec1-foss-security:v1
docker run -e GITHUB_SERVER_URL=https://github.com -e GITHUB_REPOSITORY=${GITHUB_REPOSITORY} -it --rm sec1security/sec1-foss-security:v1
