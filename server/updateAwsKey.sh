#!/bin/bash
# Copyright (C) 2018-2023 Mark McIntyre
#
# bash script to update the keyfile to remove plaintext AWS security details
#

targ=$1
force=$2

here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
if [ -f ../config.ini ] ; then
    source $HOME/dev/config.ini
    keydir=$HOME/dev/keymgmt
else
    source $HOME/prod/config.ini
    keydir=$HOME/keymgmt

fi
conda activate $HOME/miniconda3/envs/${WMPL_ENV}

export AWS_PROFILE=ukmonshared
python -m maintenance.getUserAndKeyInfo update $targ $force
export AWS_PROFILE=