#!/usr/bin/env bash

set -e

function random_port() {
    # These are listed in /proc/sys/net/ipv4/ip_local_port_range on cheyenne
    lower_port=32768
    upper_port=61000
    PORT=`shuf -i ${lower_port}-${upper_port} -n 1`
}

if [ ! -d "$HOME/miniconda/bin" ]; then
    echo "Miniconda not installed in expected location, please run setup.sh"; exit 1
fi

# put Conda in your path
export PATH="$HOME/miniconda/bin:$PATH"
unset LD_LIBRARY_PATH
hash -r

# activate the conda environment
source activate ctsm

random_port

echo "Copy this line into a new terminal on your local computer:"
echo ""
echo "ssh -N -L ${PORT}:`hostname`:${PORT} $USER@cheyenne.ucar.edu"
echo ""
echo "Then go to http://localhost:${PORT}"

jupyter lab --no-browser --ip=`hostname` --port=${PORT}
