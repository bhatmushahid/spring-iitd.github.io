# Enabling internet on a VM/PC

Follow these steps:

0. Open the terminal or ssh to your machine
1. Make sure curl is installed. Read [Install my package](package-installation.md) if you need help.

## Login Using Script
2. Download the proxy script using the following command: 

```wget www.cse.iitd.ac.in/~anupam/proxy.sh```

3. Edit the file to include your username/password. Also, if you're not a PhD student, you'll have to modify proxy61 to the appropriate url in the script.
4. Make the script executable using the command:
`chmod a+x ./proxy.sh`

5. Run the script in background using 
`./proxy.sh`
It should print "proxy login" if everything went correctly.

## Login Using GUI
2-5. Use firefox or any other program to login.

## After Logging In
6. On the terminal, set the variables:
```
export http_proxy="http://proxy61.iitd.ac.in:3128"
export https_proxy="http://proxy61.iitd.ac.in:3128"
```
You may add these lines in your ~/.bashrc file to avoid setting the variable everytime.
7. Check your internet connectivity using
`wget www.google.com`
It should download an index.html file containing the google.com html and no errors.

8. Note that if you're using sudo, use `sudo -E` to export the `http_proxy` and `https_proxy` variables. Then the internet would work for root as well.
