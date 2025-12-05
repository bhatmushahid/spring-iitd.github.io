# Proxy on Terminal

## Setting up internet on terminal

For using packages like conda, pip etc, you need internet running from your terminal. This is different from running it on a browser since the proxy settings need to be done.

Once you have [logged in proxy](internet_on_vm.md), you simply need to set the following variables.

```bash
export http_proxy="http://proxy61.iitd.ac.in:3128"
export https_proxy="http://proxy61.iitd.ac.in:3128"
```

!!! note
    Remember to replace `proxy61.iitd.ac.in:3128` with the proxy server and port assigned to you.

## Persisting the variables

I would recommend adding these variables to your `~/.bashrc` file if you are going to use this system often.

```bash
echo 'export http_proxy="http://proxy61.iitd.ac.in:3128"' >> ~/.bashrc
echo 'export https_proxy="http://proxy61.iitd.ac.in:3128"' >> ~/.bashrc
source ~/.bashrc
```

## Internet access for sudo commands

If you are the adminstrator of the system and want to run some command as root that requires internet access, you can use the `sudo -E` flag to preserve the environment variables. For example,

```bash
sudo -E apt update
```

This will run the `apt update` command as root while preserving the `http_proxy` and `https_proxy` variables.