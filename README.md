2019 CTSM Tutorial
==================

Welcome to the CTSM Tutorial! This Readme has a few instructions to get you started.

# Setup Instructions:

We've provided two scripts to help you setup your environment for the tutorial. The first, `setup.sh`, will install Python packages so we can run Jupyter and other Python applicaitons. We will just run this once.

Start by downloading the tutorail:

```bash
cd $HOME
git clone https://github.com/jhamman/ctsm_tutorial.git
cd ctsm_tutorial
```

Next, run the setup script:

```bash
./setup.sh
```

If you want to use the Conda package manager and `ctsm` environment outside of this tutorial, you should add the following line in your `.bashrc` or `.bash_profile`:

```bash
export PATH="$HOME/miniconda/bin:$PATH"
```

# Launching Jupyter:

After logging into Cheyenne, there a few simple steps you need to take to launch a Jupyter Notebook. 

First, get an interactive job on the Cheyenne share queue:

```bash
qinteractive -l walltime=6:00:00
```

Next, navigate to the ctsm_tutorial directory and run the `start_jupyter.sh` command:

```bash
cd $HOME/ctsm_tutorial
./start_jupyter.sh
```

There will be a few instructions printed out by this script. In particular, you'll want to copy a line that looks something like this

```bash
ssh -N -L 8888:r6i6n30:8888 username@cheyenne.ucar.edu
```

into a new terminal and run the command. It will ask you to authenticate using your yubikey again.

Finally, in your web browser, go to the URL printed out in the terminal. This will look something like: http://localhost:8888. Note that the port number (e.g. 8888) will likely be different.  
