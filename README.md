![Quick Piwik Logo](http://oi59.tinypic.com/2a5hces.jpg)

Quick Piwik
==========

A small shell script that will run Piwik for you within docker.

It will run two docker containers:

* [million12/nginx-php](https://registry.hub.docker.com/u/million12/nginx-php/)
* [MySql](https://registry.hub.docker.com/_/mysql/)

# Installation

This script has been designed to make Piwik installation as easy as possible.

1. Clone this repo down to a local directory.
2. Move the contents of this folder to where you want the Piwik root directory to be installed.
3. Navigate to the folder you have chosen.
4. Run ```sh install.sh```
5. At this point Piwik should be live on port 80.

Just before the "Installation Complete" message, you will see a table which lists the two containers that should be running. If in the state column you see anything other than "Up" for one of the two new containers then there has been an issue.

The most likely issue is that the MySql container will not be running. If this is the case, try the [MySql Memory Error](https://github.com/JoeeGrigg/quick-piwik#mysql-memory-error) fix below.

## MySql Memory Error

One potential error is that if you are running mysql on a machine that has a small amount of memory or doesn't have a swap file then it might crash upon boot. To fix this you need to make a swap file.

```
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile
```

That will fix the problem but if you want to make sure that when you reboot you do not get the same error again you need to add this line to ```/etc/fstab```

```
/swapfile swap swap defaults 0 0
```

Once this is done you are going to have to run the install script again. However, just running the script can cause issues so first run ```sh remove.sh``` which is a script for removing what you have just installed. Once that is done you can try installing again and hopefully this time it should work.

# Issues

If you have any issues with these scripts report and issue directly on [GitHub](https://github.com/JoeeGrigg/quick-piwik/issues) or contact me [here](mailto:joe@joegrigg.com).
