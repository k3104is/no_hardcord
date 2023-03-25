#!/bin/bash

KEY='c286696d887c9aa0611bbb3e2025a45a'
IV='562e17996d093d28ddb3ba695a2e6f58'
PLAINTEXT='000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f'

# check str to byte
echo '### PLAINTEXT ###'
echo -n ${PLAINTEXT} | xxd -r -p | xxd

# encrypted
ENCRYPTED=$(echo -n ${PLAINTEXT} | xxd -r -p | openssl enc -aes128 -K ${KEY} -iv ${IV} -nosalt -nopad -a)
echo '### ENCRYPTED ###'
echo -n ${ENCRYPTED} | base64 -d | xxd

# decrypted
echo '### DECRYPTED ###'
echo ${ENCRYPTED} | openssl enc -d -aes128 -K ${KEY} -iv ${IV} -nosalt -nopad -a | xxd
