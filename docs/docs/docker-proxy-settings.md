# Proxy settings in docker

Create a file 

`~/.docker/config.json`

with the following contents:

```
{
		 "proxies":
		  {
				     "default":
					    {
								     "httpProxy": "http://10.10.78.61:3128",
								     "noProxy": ""
						}
		  }
}
```
