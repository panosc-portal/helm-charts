PaNOSC Portal
=============================

This is to deploy a production version of the PaNOSC Portal.


The goal of this project is to simplify the deployment of the PaNOSC Portal microservices in a Kubernetes cluster.
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)

## Installation
To install the PaNOSC Portal chart, add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have to set the database hostname, usernames and passwords to access the databases by copying and modifying the values.yaml file and enter the following command:
```
helm install -f myvalues.yaml my-release panosc-portal/panosc-portal
```
or by setting the values that you want to modify with the flag --set:
```
helm install --set global.database.host=database.panosc.eu  --set global.database.cloudService.username=test --set global.database.cloudService.password=password my-release panosc-portal/panosc-portal
```


Then you will need to 
 can run the helm install command followed with the name you want to call it:
```
helm install <YourReleaseName> panosc-portal/panosc-portal
```


## Upgrade
After installing the chart, you can upgrade to a new version of the chart and set new values to it.
You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade -f myvalues.yaml panosc-portal panosc-portal/panosc-portal
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade --set panoscPortal.namespace=panosc-portal --set cloudProviderKubernetes.instancesNamespace=panosc-instances panosc-portal panosc-portal/panosc-portal
```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information
## Uninstall  
```
helm uninstall panosc-portal
```

## Values
To make this deployment work, you need to define the following values in a YAML file:

 Value | Definition | 
 ------------- | ------------- | 
cloudProviderKubernetes.replicaCount | Number of CloudProviderKubernetes replica | 1
cloudProviderKubernetes.image.registry| Define the registry where the CloudProviderKubernetes is stored | docker.io
cloudProviderKubernetes.image.repository | CloudProviderKubernetes docker image | panosc/cloud-provider-kubernetes
cloudProviderKubernetes.image.pullPolicy | Image pull policy | IfNotPresent
cloudProviderKubernetes.service.nodePorts.api | NodePort for the api | 32300
cloudProviderKubernetes.service.nodePorts.nodeJSDebug | (optional) NodePort for nodeJS debugging | 32401
cloudProviderKubernetes.namespace.instances.creation | Boolean to create or not the instances namespace | true
cloudProviderKubernetes.namespace.instances.name| Name of the instances namespace | panosc-instances 
cloudProviderKubernetes.kubernetesRequestHelperFile | Content of a file containing a  kubernetes request helper (via --set-file) |
cloudProviderKubernetes.dockerSecretFile |  Content of a file containing secrets for private docker repository (via --set-file) |
cloudProviderKubernetes.nodeSelector| Node labels for pod assignment| {}
cloudProviderKubernetes.tolerations|Toleration labels for pod assignment| []
cloudProviderKubernetes.affinity|Affinity labels for pod assignment|{}
cloudProviderKubernetes.resources|Custom resource configuration for the CloudProviderKubernetes pod | {}
cloudProviderKubernetes.logLevel| Log level of the CloudProviderKubernetes ( debug, info, warn, error | debug
cloudService.replicaCount | Number of CloudService replica | 1
cloudService.image.registry| Define the registry where the CloudService is stored | docker.io
cloudService.image.repository | CloudService docker image | panosc/cloud-service
cloudService.image.pullPolicy | CloudService image pull policy | IfNotPresent
cloudService.service.nodePorts.api | CloudService NodePort for the api | 32301
cloudService.service.nodePorts.nodeJSDebug | (optional) CloudService NodePort for nodeJS debugging | 32402
cloudService.nodeSelector| CloudService node labels for pod assignment| {}
cloudService.tolerations|CloudService toleration labels for pod assignment| []
cloudService.affinity|CloudService affinity labels for pod assignment|{}
cloudService.resources|CloudService custom resource configuration for the cloudService pod | {}
cloudService.logLevel| CloudService log level ( debug, info, warn, error | debug
global.namespace.creation | Boolean to create or not the global namespace | true
global.namespace.name | Name of namespace in witch the microservices will be installed (namespace must be already created) | default
global.database.host| Database hostname | panosc-postgres
global.database.port| Database port | 5432
global.database.type| Database type (oracle, postgres, mariadb ...) | postgres
global.database.log| Boolean to activate or not database logs | false
global.database.sync| Boolean to activate or not database synchronisation | false
global.database.cloudProviderKubernetes.username| Username to access the cloudProviderKubernetes microservice database | cloud-provider-kubernetes
global.database.cloudProviderKubernetes.password| Password to access the cloudProviderKubernetes microservice database 
global.database.cloudProviderKubernetes.databaseName| Database name for the cloudProviderKubernetes microservice | cloud-provider-kubernetes
global.database.cloudProviderKubernetes.schema| Database schema for the cloudProviderKubernetes microservice (if definable) | cloud-provider-kubernetes
global.database.cloudService.username| Username to access the cloudService microservice database | cloud-service
global.database.cloudService.password| Password to access the cloudService microservice database 
global.database.cloudService.databaseName| Database name for the cloudService microservice | cloud-service
global.database.cloudService.schema| Database schema for the cloudService microservice (if definable) | cloud-service

## Documentation
#### [Cloud Provider Kubernetes](../cloud-provider-kubernetes/README.md)
#### [Cloud Service](../cloud-service/README.md)


## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

17/08/2019 :
This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) and [Cloud Service](https://github.com/panosc-portal/cloud-service) microservices. 


