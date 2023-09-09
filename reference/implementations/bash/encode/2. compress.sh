#! /usr/bin/env bash
echo 'compressing atp-encoded.tar ...'
bzip2 -cv ./atp-encoded.tar ./atp-encoded.tar.bz2
echo 'done!'
echo 'data compressed as ./atp-encoded.tar.bz2'
exit
