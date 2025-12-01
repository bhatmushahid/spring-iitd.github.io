
Conda allows you to use multiple versions of python and pip simultaneously on a system. Another huge benefit is that now you won't require any admin privileges. So, it would work on your personal machine, HPC or a lab system where you don't have admin privileges. 

# Set it up
Download and install conda from [Anaconda](https://www.anaconda.com/products/individual) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html).

- Once you have downloaded conda, you will have to set it up in linux using `conda init`. 
- Create a new conda environment using, `conda create -n your_env_name python=3.X` where X is the python version you need. You may omit `python=` if you would like the latest version.
- Activate this environment using `conda activate your_env_name`.
- Once activated, your `python` and `pip` commands would be remapped to the anaconda versions. You may check this using `which python` and `which pip`.

# Installing packages
- After activating your environment, use `conda install package_name` to install necessary packages. A google search helps to find the exact command. 
- Conda has channels for uncommon packages which are individually maintained. The channel name can be passed as `conda install -c menpo opencv`. This installs the package `opencv` from the `menpo` channel.
- For any remaining packages, you may use `pip` as usual or build from source after activating the environment.

# Running 
- Simply use `python <file_name>` to run after having activating the conda environment.
- You may add the `conda activate my_env` to your `.bashrc` file for automatically activating the environment.
