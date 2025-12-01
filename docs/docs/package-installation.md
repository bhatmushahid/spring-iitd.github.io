Many of us struggle with installing packages using apt on our systems (mostly, when they're connected through LAN). This post should help you with understanding and being able to install packages using apt with relative ease.

# Where are the packages?

The `apt` package manager commonly used in Ubuntu maintains the list of sources of packages in `/etc/apt/sources.list`. When you are using a fresh PC, you do not have [internet running on the terminal](internet-on-my-terminal.md). Therefore, packages from Ubuntu's standard repositories are not available.

Luckily, the IITD Administration maintains a local mirror of the repositories of almost all Ubuntu versions on `repo.iitd.ac.in`.

# Enabling packages from the local repository

- Go to the [local repository website](http://repo.iitd.ac.in).
- Scroll down to the area where some lines are provided to be added to the `sources.list` file.
- Copy and paste these lines in the `/etc/apt/sources.list` file. 
- You also need to edit the `<release>` tags in the pasted content. You may find the release of your system using the command `lsb_release -a`.
- You may open the file using `sudo gedit /etc/apt/sources.list` command on your terminal.
- Once you have saved this file, run `sudo apt update` and you should be able to install packages available in the ubuntu repositories.

You can also use packages from the internet once you have internet set up on your terminal. Refer to [Running internet from the Terminal](internet-on-my-terminal.md)
