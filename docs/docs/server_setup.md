# Welcome to the Poweredge Server

When you login to the server, you are moved into the home directory `/home/<username>`. You are allocated a soft limit of 25GB and hard limit of 40GB (Files would be deleted after 7 days) for code files. Your home page contains a `/scratch` folder where there is no limits. Hence, it's recommended to put all your heavy stuffs like data and models in the scratch and use the home folder storage only for code and other lighter files. This quota is added for all the users.

If you need access to the server, please contact Anwesh Badapanda (https://spring.iitd.ac.in/team/)

## Proxy and Internet Access

You need to setup proxy for accessing the internet.
Follow the instructions on this page for setting up the proxy: [Proxy Steup Guide](internet_on_vm.md)

!!! note

  - proxy21 for BTech/Staff
  - proxy61 for PhD
  - proxy62 for Dual/ Mtech
  - xen03 for research proxy

## Installation

As an user, you **CAN NOT** install any ubuntu packages using **apt**. However, you're **ALLOWED** to install any python packages. One way of efficiently installing and managing different python projects is through *conda*.

### Using Miniconda

Miniconda is a lighter version of Anaconda, suitable for use in the server.

Step 1: Download Miniconda

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_24.5.0-0-Linux-x86_64.sh
```

NOTE: You can install your required version of Miniconda from this page. Just change the link in the above command to your required version. Make sure to always go for **Linux-x86_64** variant irrespective of the version!

Step 2: Install Miniconda

```bash
bash Miniconda3-py310_24.5.0-0-Linux-x86_64.sh
eval "$(/home/<username>/scratch/miniconda3/bin/conda shell.bash hook)"
conda init
conda create -n <env-name> python=3.10
conda activate <env-name>
```

Step 3: [Setting up Environments](using_conda.md)

## Server Access

### Passwordless Login

Apart from the conventional ssh access with username and password, you can setup for **Passwordless SSH Login**.

First, you can check if the SSH key for the client machine already exists. This will prevent overwriting the current configuration. You can use the below command to find out:

```bash
ls -al ~/.ssh/id_*.pub
```

If you find an existing key, then you can skip the SSH key generation steps. If the key doesn’t exist, you’ll see the following output:

```bash
ls: cannot access /users/appsadm/.ssh/id_*.pub: No such file or directory
```

If not present, to generate a public and private key on Ubuntu or CentOS, use the command:

```bash
ssh-keygen -t rsa
```

This is an interactive key generation process and you will be asked a few questions like:

Enter file in which to save the key (/home/.ssh.id_rsa):\
Enter passphrase (empty for no paraphrase):

You can press enter for both these questions and this will take the default values.

The private key will be saved in the default location – ```.ssh/id_rsa```. The public key will be saved in the ```.ssh/id_rsa.pub``` file. This completes the key generation.

Then copy the public key to enable passwordless SSH:

```bash
ssh-copy-id <username>@<poweredge-ip>
```

### Access through Visual Studio Code (VS Code)

You can also access the server through VS Code using the Remote - SSH extension.

!!! note
  The process of connecting to the server through VS Code for the first time may take a few minutes as it needs to install the VS Code server on the remote machine. You could also install it manually by following [this guide](https://code.visualstudio.com/docs/remote/vscode-server).

Follow these steps:

1. Install the Remote - SSH extension in VS Code.
2. Open the Command Palette (Ctrl+Shift+P) and type "Remote-SSH: Connect to Host...".
3. Enter the SSH connection string: `<username>@<poweredge-ip>`.
4. If prompted, enter your SSH password.
5. Once connected, you can open a terminal in VS Code and start working on the server.
