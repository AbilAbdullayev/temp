#!/usr/bin/env bash
#
# v.1

set -e
set +o pipefail

aws sts assume-role \
--role-arn $1 \
--role-session-name $2 \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken,Expiration]" \
--output text | awk '
BEGIN {print "[default]"} 
{ print "aws_access_key_id = " $1 } 
{ print "aws_secret_access_key = " $2 } 
{ print "aws_session_token = " $3 } 
{ print "x_security_token_expires = " $4}' > $3

export AWS_CONFIG_FILE=./credentials
aws sts get-caller-identity