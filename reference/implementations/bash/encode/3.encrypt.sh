#! /usr/bin/env bash
echo 'encrypting file with symmetric cipher using gpg...'
gpg --output ./atp-encoded.tar.bz2.gpg --symmetric ./atp-encoded.tar.bz2
echo 'done!'
echo 'output file is ./atp-encoded.tar.bz2.gpg'
exit