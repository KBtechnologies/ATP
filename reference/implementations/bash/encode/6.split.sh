#! /usr/bin/env bash
echo 'splitting the container into 2.953 bytes per chunk...'
mv ./atp-encoded.tar.bz2.gpg ./container.atp
split --verbose -d -b 2953 - ./container.atp ./container.atps.
echo 'done!'
exit