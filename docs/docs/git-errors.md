## Cannot connect with git clone

Make sure you have set your proxy variables in the git config.

```
git config --global http.proxy http://proxy61.iitd.ac.in:3128
git config --global https.proxy https://proxy61.iitd.ac.in:3128
```

Note that it would be 

- `proxy21` for BTech/Staff
- `proxy61` for PhD 
- `proxy62` for Dual 
- `xen03` for research proxy.

## Repository not cloning

Note that `git:` and `ssh` repos don't work.
