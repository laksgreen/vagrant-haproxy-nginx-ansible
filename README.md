# High Available HAProxy Setup acting as proxy to Google.com
----------------------------------------------------------

### How to Use it:
-------------

Clone this repository,
```
Execute the shell script:
```
./execute.sh
```

We have used the following tools:

* Vagrant	- VirtualBox
* HAProxy   	- LB Server
* KeepAlived	- Monitor the Service
* Ansible	- Automation

### Access the domain name on the browser: 

https://my-google.com 

### To access the HAProxy stats:

http://192.168.0.200:9000/stats

### HAProxy Master, slave and VIP for Keepalived:

* Virtual IP    : 192.168.0.200
* HAProxy Master: 192.168.0.101
* HAProxy Slave : 192.168.0.102
