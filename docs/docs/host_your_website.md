CSE department allows you to host a static website at the url www.cse.iitd.ac.in/~<user>. Following steps need to be followed:

* Go to GCL Lab (4th floor, Bharti Building) and submit the application for a new account. 
* Make sure you request the username you want to be your website url. The URL hosted would be www.cse.iitd.ac.in/~username
* Once you get the username, ssh to palasi/sri from anywhere in the IIT network.
`ssh username@palasi.cse.iitd.ac.in`
* In the home directory of your sri/palasi account, you may create two directries: `public_html` and `private_html`. Any files you put in the `public_html` folder would be hosted at `www.cse.iitd.ac.in/~username` and the files in `private_html` would be hosted at `https://poorvi.cse.iitd.ac.in/~username`, just like this website.

## Securing your website

If you would like to password protect the website or a sub-directory, you may use the following method.

* Create a `.htaccess` file inside the directory you want to protect with the following contents. Note that all subdirectories would be protected.

```
AuthUserFile <full path to .htpasswd>
AuthName "Dummy Name"
AuthType Basic
<Limit GET POST>
require valid-user
</Limit>
```

For creating the `.htpasswd` file, use the command from palasi/sri:
```
htpasswd -bc .htpasswd username password
```
