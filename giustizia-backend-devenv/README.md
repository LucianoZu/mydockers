# giustizia-backend-devenv 

This is an ubuntu image with Eclipse 2019-06, Oracle WebLogic 12 (develop version) and JBoss AS 4.2.3 GA preinstalled.
This image is the basic backend environment for "Giustizia" project I follow.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/giustizia-backend-devenv/)

Or you can dowload it with:

> docker pull lucianozu/giustizia-backend-devenv

## INFO
Before calling docker build you need for several archives you have to put in bundle subdir

You can find this file as binary in github version tags.

Ar the first startup you need for a Weblogic domain. You can do it with this:

> /home/weblogic/wls12210/oracle_common/common/bin/config.sh 

NOTE: a volume for weblogic domains is already defined at path: **/home/developer/wls12210/user_projects**

So you are adviced to use this path. Using a volume Weblogic will be faster and your domains will be portable.


NOTE: a volume for JBoss servers is already defined at path: **/home/developer/jboss-4.2.3.GA/server**

So you are adviced to use this path. Using a volume JBoss will be faster and your servers will be portable.


NOTE: a volume for workspaces is already defined at path: **/home/developer/workspaces**

So you are adviced to use this path. Using a volume eclipse will be faster and your workspaces will be portable.

You should install eclipse weblogic tools plug-in (JBoss tools are preinstalled).