#! /usr/bin/env bash
echo 'creating checksum for complete container...'
openssl dgst -sha3-512 ./atp-encoded.tar.bz2.gpg | tail ./atp-encoded.header
echo 'done!'
echo 'SHA3-512 of the container saved to header file.'
exit
