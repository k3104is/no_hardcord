#!/bin/bash

PW="password"
KEY=$(dd if=/dev/urandom bs=16 count=1 | xxd -p) 
IV=$(dd if=/dev/urandom bs=16 count=1 | xxd -p)

echo '### PLAINTEXT ###'
echo ${PW}

#encrypted
echo '### ENCRYPTE ###'
ENC_PW=$(echo -n ${PW} | openssl enc -aes128 -a -K ${KEY} -iv ${IV})
echo ${ENC_PW}

#decrypted
echo '### DECRYPTED ###'
DEC_PW=$(echo ${ENC_PW} | openssl enc -d -aes128 -a -K ${KEY} -iv ${IV})
echo ${DEC_PW}
