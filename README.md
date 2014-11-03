btsync
======

btsync - http://getsync.com

btsync on Arch Linux

**Pull image**

```
docker pull atbell/arch-btsync
```

**Run container**

```
docker run -d -p <webui_port>:<webui_port> --name=<name> -v <path for config files>:/config -v <path for data files>:/data -v /etc/localtime:/etc/localtime:ro atbell/arch-btsync
```

Please replace all user variables in the above command defined by <> with the correct values.