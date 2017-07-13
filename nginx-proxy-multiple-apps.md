
on localhost, shut-down the phoenix app if it's running:
```
mix edeliver stop production
```


Login to the VM via SSH e.g:
```
ssh hladmin@51.140.86.5
```

Install NGINX if you don't *already* have it:
```
sudo apt-get update
sudo apt-get install nginx -y
sudo service nginx start
sudo service nginx status
```

check if you have a Firewall rule for redirecting port 80 to 4000:
```
sudo iptables -t nat --line-numbers -L
```
in our case the rule is number 1.

remove the iptables rule:
```
sudo iptables -D INPUT 1
```
The output was:
```
iptables: Index of deletion too big.
```
(_but it worked!_)


for some reason NGINX is not starting
read the logs:
```
tail /var/log/nginx/error.log
```


## References

+ http://nginx.org/en/docs/beginners_guide.html
+ https://dennisreimann.de/articles/phoenix-nginx-config.html
+ https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04
+ https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
+ https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04
+ https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts
+ https://wincent.com/wiki/Checking_nginx_config_file_syntax
+ https://serverfault.com/questions/654957/nginx-emerg-server-directive-is-not-allowed-here-in-etc-nginx-nginx-conf7
+ https://www.digitalocean.com/community/questions/configure-nginx-for-multiple-subdomains
+ https://www.digitalocean.com/community/questions/how-to-create-subdomain-with-nginx-server-in-the-same-droplet
+
