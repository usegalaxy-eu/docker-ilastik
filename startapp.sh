#!/bin/sh -f

# Calls the symlink under /bin
if [ ! -e /bin/ilastik_with_args ]; then
    echo "RUNNING ILASTIK WITHOUT ARGS"
    ilastik
else
    echo "RUNNING ILASTIK WITH CUSTOM ARGS"
    ilastik_with_args
fi
