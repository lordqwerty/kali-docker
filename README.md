Kali on Docker with X11 window forwarding
=========================================

This repo contains Dockerfiles for different flavours of Kali Linux, and a
Makefile that automates your required configuration for X11 window forwarding.
This means that you can run GUI applications on your OS of choice.

At current this script has only been tested on Linux and MacOS.

Prerequisites
-------------

We assume the following before you continue:

1. Docker is installed
2. You have an X11 Window Manager
    - If you run Linux the answer to this is probably yes
    - MacOS you'll need [XQuartz](https://www.xquartz.org/)
    - Windows you'll need [XMing](https://sourceforge.net/projects/xming/)


Setup
-----

Building and running a Kali container is as simple as:

 ```bash
$ make all
 ```

There are a number of configuration options you can specify. For example, the
Kali Metapackage you want to install. The options are as follows:

- `default`: `$ make all META_VERSION=default`
- `top10`: `$ make all META_VERSION=top10`
- `large`: `$ make all META_VERSION=large`
- `everything`: `$ make all META_VERSION=everything`

Details about each of the metapackages can be seen on the
[Kali website](https://www.kali.org/news/major-metapackage-makeover/).

Once your container is built in the future you can execute `make run` to
launch the container. Note that if you want to update the container you'll need
to rebuild the image.

Run time customisations
-----------------------

If you're running Linux you can additionally map in drivers to a Docker Container
at run time. For example, if you wanted to use GPU acceleration then:

```bash
$ make run USER_OPTS="-d /dev/dri"
```

