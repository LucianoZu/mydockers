# azure-kube-client

This is an ubuntu image. Just to experiment.

Docker image is located at:
[lucianozu dockerhub](https://hub.docker.com/r/lucianozu/azure-kube-client/)

Or you can dowload it with:

> docker pull lucianozu/azure-kube-client

In order to config this container for kubernetes on Microsoft Azure make the following steps.

> az login --use-device-code

On a browser at the specified URL post the given code and wait for the login. Then check for the right subscription where your kubernetes cluster is and set it.

> az account set -s \<your subscription hash\>

Set desidered kubernetes cluster inside your subscription

> az aks get-credentials --resource-group \<your resource group\> --name \<your kubernetes name\>

Test your configuration

> kubectl get nodes

And config helm

> heml init

Get a deployment linst in order to verify that tiller is up and running

> kubectl get deployment -A

Now you have to authorize tiller

> kubectl create serviceaccount --namespace kube-system tiller

> kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

> kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'      

> helm init --service-account tiller --upgrade

Ok, you can works with your k8s. You can install an ingress controller like nginx:
> helm install stable/nginx-ingress --name nginx-ingress

Or like Contour:
> kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

Check if Azure is configured with an HTTP application routing domain:
> az aks show --resource-group \<your resource group\> --name \<your kubernetes name\> --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table

Define an Ingress with the right annotation in order to use this domain. The key annotation is:
**kubernetes.io/ingress.class: addon-http-application-routing**

Read this article for more details:
https://docs.microsoft.com/it-it/azure/aks/http-application-routing


If you have installed a RabbitMQ HA with the command:
> helm install stable/rabbitmq-ha --name message-broker  --set rabbitmqUsername=admin,rabbitmqPassword=secretpassword,managementPassword=anothersecretpassword,rabbitmqErlangCookie=secretcookie

you can write down a yaml file for Ingress like this:

    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: simple-ingress
    spec:
      backend:
        serviceName: message-broker-rabbitmq-ha
        servicePort: 15672

And apply it with:
> kubectl apply -f \<filename.yaml\>

Check your exposed IP with:
> kubectl get service -A

If you have configured Azure HTTP application routing domain then your YAML file could be:

    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: message-broker-rabbitmq-ha
      annotations:
        kubernetes.io/ingress.class: addon-http-application-routing
    spec:
      rules:
      - host: f964732446aa4eef8bda.westeurope.aksapp.io
          http:
          paths:
          - backend:
            serviceName: message-broker-rabbitmq-ha
            servicePort: 15672

**Warning the file here doesn't work properly**

Ok, now let me switch in Italian for some notes I'm taking for the future...

Si può installare prometheus utilizzando Helm inoltre esiste un exporter per RabbitMQ ed ElasticSearch.

Digitare il comando:
> helm search | grep -i prometheus

Per maggiori informazioni ed entry a riguardo.

Sempre con Helm si può installare ELK ed ElasticSearch.

> helm search | grep -i elastic

Stessa considerazione per Linkerd. Per installare invece il competitor Istio è necessario prima aggiungere il repository ad Helm con il comando:

> helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.3.3/charts/

Quale scegliere fra Istio e Linkerd. Ho letto questo interessante articolo:
https://itnext.io/linkerd-or-istio-2e3ce781fa3a

Che sostanzialmente dice che Istio ha più feature mentre Linkerd è più veloce. Molto interessante fa riferimento a SuperGloo che è un'astrazione che permette di usare allo stesso tempo entrambi (ovviamente per provarli non in produzione) https://supergloo.solo.io/

Probabilmente visto che linkerd è più nuovo e più veloce anche se ha qualche funzionalità in meno potrebbe valere la pena provare questo su progetti che non presentano complessità particolarmente avanzate. Sarebbe interessante capire quanto è possibile sostiutire un service mesh con un altro oppure se si tratta di una decisione da prendere subito e sulla quale non è facile tornare sui propri passi.

## Come installare Oracle su kubernetes

### Creare un'immagine docker

Clonare il repository git:
https://github.com/oracle/docker-images

Andare quindi su:
docker-images/OracleDatabase/SingleInstance/dockerfiles

e copiarci su l'immagine del database d'interesse preso da:
http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

Lanciare (come descritto sul README del repository) lo script buildDockerImage.sh


