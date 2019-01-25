# native-script-devenv 

This is an image with NodeJS, Visual Studio Code and Android SDK preinstalled.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/native-script-devenv/)

Or you can dowload it with:

> docker pull lucianozu/native-script-devenv

NOTE: a volume for global NodeJS libaries is already defined and configured at path: **/home/vscode/global**

So you are adviced to use this path. Using a volume NodeJS and npm will be faster and your domains will be portable.

NOTE: a volume for workspaces is already defined at path: **/home/vscode/workspaces**

So you are adviced to use this path. Using a volume code will be faster and your workspaces will be portable.

NOTE: a volume for android sdk is already defined at path: **/home/vscode/android**

The first commands you should run are:
> npm install -g @angular/cli
> sdkmanager --proxy=http --proxy_host=172.17.0.1 --proxy_port=3128 --update
> sdkmanager --proxy=http --proxy_host=172.17.0.1 --proxy_port=3128 "tools" "emulator" "platform-tools" "platforms;android-28" "build-tools;28.0.3" "extras;android;m2repository" "extras;google;m2repository" "system-images;android-25;google_apis;x86"
> avdmanager create avd -n test -k "system-images;android-25;google_apis;x86"
> npm install nativescript -g --unsafe-perm

NOTE: sdkmanager needs for proxy settings (if you are behind  a proxy of course) in the rows above is set a local proxy to host machine

Now you have to run (AS ROOT se 31_connect_as_root.sh) the emulated device with the following command:
> emulator -avd test

Instead of this command you can use 36_emulator.sh

You should set Proxy in settings properties.

NOTE: emulator has to be launched by root user because hardware acceleration kvm issue.

You are almost ready to start:
> tns doctor
To check if install is ok

> tns proxy set $https_proxy
To set proxy to tns command
BE ADVICED this command you have to configure proxy for gradle too. You have to edit file:
.gradle/gradle.properties
in your user folder adding following rows:

systemProp.http.proxyHost=www.somehost.org
systemProp.http.proxyPort=8080
systemProp.http.proxyUser=userid
systemProp.http.proxyPassword=password
systemProp.http.nonProxyHosts=*.nonproxyrepos.com|localhost
systemProp.https.proxyHost=www.somehost.org
systemProp.https.proxyPort=8080
systemProp.https.proxyUser=userid
systemProp.https.proxyPassword=password
systemProp.https.nonProxyHosts=*.nonproxyrepos.com|localhost

> tns device
To check if **test** device is found (emulator has to be up and running)

> tns create HelloWorld1 --ng
Inside workspaces folder to create an app with Angular
You can use also the following command:
> tns create HelloWorld2 --template tns-template-blank-ng


Check Native Script CLI docs at [Native Script CLI](https://docs.nativescript.org/angular/start/cli-basics)
