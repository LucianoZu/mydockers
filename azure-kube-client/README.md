# azure-kube-client

This is an ubuntu image. Just to experiment.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/azure-kube-client/)

Or you can dowload it with:

> docker pull lucianozu/azure-kube-client

In order to config this container for kubernetes on Microsoft Azure make this steps:

> az login --use-device-code
On a browser at the specified URL post the given code and wait for the login

> az account set -s <your subscription hash>
Check for the right subscription where your kubernetes cluster is and set it

> az aks get-credentials --resource-group <your resource group> --name <your kubernetes name>
Set desidered kubernetes cluster inside your subscription

> kubectl get nodes
Test your configuration

> heml init
Config helm

> kubectl get deployment -A
In order to verify that tiller is up and running

Then you have to authorize tiller
> kubectl create serviceaccount --namespace kube-system tiller
> kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
> kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'      
> helm init --service-account tiller --upgrade

Now you can works with your k8s. You can install an ingress controller like nginx:
> helm install stable/nginx-ingress --name nginx-ingress

Check if Azure is configured with an HTTP application routing domain:
az aks show --resource-group <your resource group> --name <your kubernetes name> --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table

Define a Ingress with the right annotation in order to use this domain like:
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: party-clippy
  annotations:
    **kubernetes.io/ingress.class: addon-http-application-routing**
spec:
  rules:
  - host: party-clippy.<CLUSTER_SPECIFIC_DNS_ZONE>
    http:
      paths:
      - backend:
          serviceName: party-clippy
          servicePort: 80
        path: /

