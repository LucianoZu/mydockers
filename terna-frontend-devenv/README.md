# terna-backend-devenv 

This is an image with NodeJS and Visual Studio Code preinstalled. This image is the basic frontend environment for 2Meter project I follow in Terna S.p.A.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/terna-frontend-devenv/)

Or you can dowload it with:

> docker pull lucianozu/terna-frontend-devenv

NOTE: a volume for global NodeJS libaries is already defined and configured at path: **/home/vscode/global**

So you are adviced to use this path. Using a volume NodeJS and npm will be faster and your domains will be portable.


NOTE: a volume for workspaces is already defined at path: **/home/vscode/workspaces**

So you are adviced to use this path. Using a volume code will be faster and your workspaces will be portable.

The first command you should run is:
> npm install -g @angular/cli