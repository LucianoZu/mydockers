# terna-backend-devenv 

This is an ubuntu image with Eclipse 2018-09 (4.9.0) and Oracle WebLogic 12 (develop version) preinstalled. This image is the basic environment for 2Meter project I follow in Terna S.p.A.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/terna-backend-devenv/)

Or you can dowload it with:

> docker pull lucianozu/terna-backend-devenv

## INFO
Before calling docker build you need for an archive named **bundle.tar.gz**.

You can find this file as binary in github version tags.

1. Bundle archive should have files with uid and gid equal to 1000 (into the image 1000 will be weblogic user)

2. Bundle archive **must** contains:

- eclipse folder with eclipse version you like (and with all plug-in you like, actually there are: Subclipse and Oracle WebLogic Server Tools)
- fmw_12.2.1.0.0_wls_quick.jar that is the WebLogic 12 (develop edition) installer you can dowload from Oracle
- jdk-8u181-linux-x64.tar.gz
- README.txt that is an info file that contains the following content

#### README.txt

Ar the first startup you need for a Weblogic domain. You can do it with this:

> /home/weblogic/wls12210/oracle_common/common/bin/config.sh 

NOTE: a volume for domains is already defined at path: **/home/weblogic/wls12210/user_projects**

So you are adviced to use this path. Using a volume Weblogic will be faster and your domains will be portable.


NOTE: a volume for workspaces is already defined at path: **/root/workspaces**

So you are adviced to use this path. Using a volume eclipse will be faster and your workspaces will be portable.
