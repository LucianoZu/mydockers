# oracle-data-modeler 

This is an ubuntu image with Oracle Datamodeler 19.1.0.081.0911 preinstalled.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/oracle-data-modeler/)

Or you can dowload it with:

> docker pull lucianozu/oracle-data-modeler

## INFO
You can use 30_connect.sh to open a bash shell and type datamodeler to run the application


NOTE: a volume to save models is already defined at path: **/home/developer/models**

NOTE: In order to install datamodeler the original RPM was changed into a tar.gz with
the command

**rpm2cpio <rpmfile> | cpio -idmv**

and then:
**tar -czvf ***

You can found this file as a github tag attachment.

