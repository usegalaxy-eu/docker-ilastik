#!/bin/sh -f

# script to run Ocean Data View 64 bit on a Linux 64 bit system

# edit the lines immediately following #TODO, set execute attribute and
# move to a directory in your path. USAGE: run_odv [collection]

# © 2023 Reiner Schlitzer,
#        Alfred Wegener Institute,
#        Bremerhaven, Germany
#        Reiner.Schlitzer@awi.de



#-----------------------------------------------------------------------
# nothing to be changed below this line


exec /opt/qupath/QuPath/bin/QuPath $1 $2 $3 $4 $5
