#!/bin/sh

ENV_DIR='.venv'

if [[ ! -d $ENV_DIR ]]
then
    echo "Creating environment."
    python3 -m venv $ENV_DIR
fi

echo "Activating environment."
source $ENV_DIR/bin/activate

echo "Installing required packages."
pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html

source $ENV_DIR/bin/activate
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PYTHONPATH=$DIR/src
export JUPYTER_PATH=$DIR/src
cd $DIR/src
