#!/bin/sh

#set +v

stack build build-plugins-for-blobs
stack exec build-plugins-for-blobs $@
