#!/bin/bash
KEY=$(dd if=/dev/urandom bs=16 count=1 | xxd -p)
IV=$(dd if=/dev/urandom bs=16 count=1 | xxd -p)

openssl enc -aes128 -a -in ./hello.sh -out ./hello.enc -K ${KEY} -iv ${IV}
cat ./hello.enc

eval "$(openssl enc -aes128 -d -a -in ./hello.enc -K ${KEY} -iv ${IV})"
