# Git/Github on Linux Servers

When you are trying to clone a git repository on the Linux servers/workstations, you might face some issues. Here are some common errors and their solutions.

## Unable to access GitHub private repository

Make sure you have set up your SSH keys and added the public key to your GitHub account. Follow the steps mentioned in [GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

- Download the Github CLI tool using your package manager. For example, on Ubuntu, you can use:

  ```bash
  sudo apt install gh
  ```

- Authenticate using the CLI tool:

  ```bash
  gh auth login
  ```

- Now, try cloning the repository again using SSH:

  ```bash
  git clone https://github.com/[username]/[repository].git
  # OR
  gh repo clone [username]/[repository]
  ```

## Cannot connect with Git Clone

Make sure you have set your proxy variables in the git config.

```bash
 git config --global http.proxy http://proxy61.iitd.ac.in:3128
 git config --global https.proxy https://proxy61.iitd.ac.in:3128
```

> [!TIP]
>
> Note that it would be
>
> - `proxy21` for BTech
> - `proxy61` for PhD
> - `proxy62` for Dual Degree and MTech
> - `xen03` for research proxy

## Repository not cloning

Note that `git:` and `ssh` repos don't work.
