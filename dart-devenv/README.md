# dart-devenv 

This is an image with Dart SDK (from google) and Visual Studio Code with Dart plugin preinstalled. This image is suitable to
develop Web and Server-Side applications.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/dart-devenv/)

Or you can dowload it with:

> docker pull lucianozu/dart-devenv

NOTE: a volume for global dart libaries is already defined and configured at path: **/home/developer/.pub-cache**

So you are adviced to use this path.

NOTE: a volume for workspaces is already defined at path: **/home/developer/workspaces**

So you are adviced to use this path. Using a volume will be faster and your workspaces will be portable.

