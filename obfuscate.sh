#!/bin/bash


PW='password'

# encode to base64
BASE64_PW=$(echo ${PW} | base64)
echo '### ENCODED ###'
echo ${BASE64_PW}

# decode from base64
echo '### DECODED ###'
echo $(echo ${BASE64_PW} | base64 -d)
