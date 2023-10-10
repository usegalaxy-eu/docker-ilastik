#!/bin/sh -f

# Calls the symlink under /bin
#HOME="/tmp" 
if [ ! -e /bin/run_ilastik ]; then
    echo "RUNNING ILASTIK"
    ilastik
else
    run_ilastik
fi
