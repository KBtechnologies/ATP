#! /usr/bin/env bash
echo 'Collecting files...'
echo 'source: ./atp-cache/encode/'
tar czpvf ./atp-cache/encode/ ./atp-encoded.tar

echo 'done!'
echo 'archive is ./atp-encoded.tar'

exit