---
title: Using internet on a terminal
---
# Setting up internet on the terminal

For using packages like conda, pip etc, you need internet running from your terminal. This is different from running it on a browser since the proxy settings need to be done.

Once you have [logged in proxy](internet_on_vm.md), you simply need to set the following variables.

```
export http_proxy="http://proxy61.iitd.ac.in:3128"
export https_proxy="http://proxy61.iitd.ac.in:3128"
```

I would recommend adding these variables to your `~/.bashrc` file if you are going to use this system often.

Note that when running as root, eg, `sudo apt install tmux`, you should use `sudo -E apt install tmux` to export these variables for the root user. 
