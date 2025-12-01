[HPC](http://supercomputing.iitd.ac.in/) is the IITD Facility which allows usage of multiple CPU/GPU nodes in order to run applications. I have mostly used it for training neural networks using Pytorch/Tensorflow on GPU Machines. In this post, I am going to explain the basics of using HPC.

# Getting Access
You may request access from [here](https://userm.iitd.ac.in/usermanage/hpc.html). Login with your kerberos ID. The uuid is the username for the faculty who is going to approve your request, e.g., chetan. You will have to be on the IITD Internal network for doing this. You may use [ssh](living-life-in-an-ssh-session.md) or VPN for connecting to the IITD Network from outside.

# Getting Started
Once you have access to HPC, you are ready to login. HPC allows users to login through login nodes. The login nodes are only to get you inside the HPC interface. You may view files or download packages from login shells but you should NOT run compute-heavy code on the login shell. You may connect to the login node using any ssh client, such as PuTTY for Windows and directly from the terminal for Linux.

```
CPU Login Shell: ssh <kerberos_user>@hpc.iitd.ac.in
GPU Login Shell: ssh <kerberos_user>@gpu.hpc.iitd.ac.in
```

In my earlier experience, I am only able to access internet on the CPU login shell. If you need help logging into proxy, look [here](internet-on-my-terminal.md). I was able to test that the internet works on interactive shells as well (described later). 

You now have access to the HPC directories. You would be logging into the home area for your user. Use the home area for critical files, output logs etc. The home area has limited storage (30G), but it is not erased during maintenance. Another area of use is the scratch area which has 200TB per user (Yeah!). [Source](http://supercomputing.iitd.ac.in/?FAQ)

The best way to set up Tensorflow/PyTorch in my opinion is to use conda. However, let me introduce you to modules first. Typically, on a multi-user system, if an application is installed by the root, it is accessible to all the users. However, as one can imagine, HPC has a lot of installations and versions. Thus, HPC uses modules to allow access to specific programs to the users. The following command dumps the list of available modules in the file modules.list.

```
module avail 2> modules.list
```

Some of the software available as module is as follows:
```
apps/Matlab/r2019a/precompiled
apps/pythonpackages/3.6.0/tensorflow/1.9.0/gpu
apps/pythonpackages/3.6.0/pytorch/0.4.1/gpu
compiler/cuda/9.2/compilervars
```
You can load a module with `module load <package_name>`. GCC, CUDNN, Some Python Packages are all available as modules and area very good when you need to use the packages **as is**. If and when modifications are required, it is a pain to manage versions and since pip is going to be redefined as you load a module (you can check with `which pip`), you cannot install new packages since the packages directory is centrally controlled. 

Now, let's discuss the recommended way, i.e., conda. Install anaconda/miniconda by downloading the installer. Use conda to create a new environment. 

`conda create -n <new_env_name>`

`conda activate <env_name>`

Once you activate a conda environment, you use either `pip install` or `conda install` to install new packages. The internet should be set up as described before. For some packages, like cuda, gcc, etc. use modules whenever required. Note that modules should be activated *before* you activate the conda environment.  You may check imports etc on the login shell itself.

# Testing your scripts

For testing your scripts, you should use an interactive shell.

```
For a CPU shell: qsub -I -P cse -N interactive_shell -lselect=1:ncpus=4 /bin/bash
For a GPU shell: qsub -I -P cse -N interactive_shell -lselect=1:ncpus=1:ngpus=1 /bin/bash
```
I keep these commands in `getCPUShell.sh` and `getGPUShell.sh` in my home directory for easy access. So, whenever you would like to run a certain code, just fire up an interactive shell. Note that internet does not work here. So, all installations should be done on the CPU login node. It is a little bit of a discomfort since you might be installing something related to the GPU node, so you'll have to install it in the CPU node and open a GPU interactive shell for testing if the installation works. I keep all module loads for a project in a file so that I can source it on any new terminal I open.

# Job Submission
While you can test and run day-long jobs in the interactive shell (use tmux or screen to keep it running even if you have to turn off your PC), it is not recommended to do so since the compute cluster would remain idle even after your job has completed. This may result in a ban from HPC as well. You can submit jobs to the HPC cluster and get emails when the jobs complete. I would highly recommend testing the job script interactively before leaving it to run.

I have 4 scripts which I use frequently.
- [Short CPU](./small_cpu_job.sh)
- [Long CPU](./long_cpu_job.sh)
- [Short GPU](./small_gpu_job.sh)
- [Long GPU](./long_gpu_job.sh)

You may use these as 
```
~/small_cpu_job.sh python script.py
```
Note that I also load conda before running the script, i.e., the module that has been loaded on terminal automatically gets loaded when the job is run. You might have to edit the conda path based on your installation. You may simply comment the line if you do not want conda. The short jobs have a wall limit of 1 hour (though you get scheduled quickly) while the long jobs last for 2 days (you can change this to upto 7 days).

You can look up job submission documentation [here](http://supercomputing.iitd.ac.in/?pbs). Since the requirements are different every time, one has to use this page often as a reference. A few tips I would give is to keep wall times short for faster scheduling of jobs. Also, for longer jobs, always dump outputs in a file so that you know when something goes wrong.

Have fun with HPC!
