#!/bin/sh

#set +v

cabal build build-plugins-for-blobs
exec cabal run build-plugins-for-blobs -- "$@"