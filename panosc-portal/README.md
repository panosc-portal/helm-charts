PaNOSC Portal
=============================

This is to deploy a production version of the PaNOSC Portal.


The goal of this project is to simplify the deployment of the PaNOSC Portal microservices in a Kubernetes cluster.
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)
- A identity provider that uses OpenID Connect


## Installation
To install the PaNOSC Portal chart, add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you can run the helm install command followed by: 
- The hostname of your Kubernetes mater node
- The URL to the OpenID discovery endpoint of your IDP
- The Client ID configured in your OpenID provider 
- The attribute name in your IDP providing that is used for login
- The hostname of your database
- The password for the database user cloud-provider-kubernetes, cloud-service, desktop-service and account-service


You can also specify a existent namespace with the flag -n if you dont want to install the cart in the default namespce
```
helm install <YourReleaseName> panosc-portal/panosc-portal-demo \
--set global.kubernetesMasterHostname=Yourk8sMaster> \
--set account-service.idp.url=<YourOpenIDDiscoveryEndpoint> \
--set account-service.idp.clientId=<YourClientID> \
--set account-service.idp.loginField=<YourLoginField> \
--set global.database.host=<YourDatabaseHost> \
--set global.database.cloudProviderKubernetes.password=<CloudProviderKubernetesPassword> \
--set global.database.cloudService.password=<CloudServiceKubernetesPassword> \
--set global.database.desktopService.password=<DesktopServicePassword> \
--set global.database.accountService.password=<AccountServicePassword> \
-n <YourExistentNamespace>
```
You can also create a values.yaml file by copying the one in the chart and setting the necessary values and using the 
flag -f to reference this file

````
helm install <YourReleaseName> panosc-portal/panosc-portal-demo \
-f <PathToYourValuesFile> -n <YourExistentNamespace>
````

If you want to modify other values, see the list of values bellow.

## Upgrade
After installing the chart, you can upgrade to a new version of the chart and set new values to it.
Like the installation, you can ether specify a value file with the flag "-f" followed by the path to your values file :
```
helm upgrade -f myvalues.yaml panosc-portal panosc-portal/panosc-portal \
-n <YourReleasetNamespace>
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade panosc-portal panosc-portal/panosc-portal \
--set cloud-provider-kubernetes.instancesNamespace=panosc-instances \
-n <YourReleasetNamespace>
```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information

## Uninstall  
```
helm uninstall panosc-portal
```

## Values
This helm chart integrates multiple charts. For each of them, the values that have been set can be changed by specifying
the chart name and the name of the value in the values.yaml file.

### CloudProviderKubernetes 
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
cloud-provider-kubernetes.replicaCount | Number of cloudProviderKubernetes replica | 1
cloud-provider-kubernetes.image.registry| Define the registry where the cloudProviderKubernetes is stored | docker.io
cloud-provider-kubernetes.image.repository | CloudProviderKubernetes docker image | panosc/cloud-provider-kubernetes
cloud-provider-kubernetes.image.pullPolicy | Image pull policy | Always
cloud-provider-kubernetes.image.dockerTag | CloudProviderKubernetes docker tag | 1.0.0
cloud-provider-kubernetes.kubernetesMasterHostname | Hostname or ip of the kubernetes master node |
cloud-provider-kubernetes.namespace.instances.creation | Boolean to create or not the instances namespace | true
cloud-provider-kubernetes.namespace.instances.name| Name of the instances namespace | panosc-instances 
cloud-provider-kubernetes.service.type | Kubernetes Service type | ClusterIP
cloud-provider-kubernetes.service.apiPort | Service API port | 3000
cloud-provider-kubernetes.service.nodePorts.api | NodePort for the api | 
cloud-provider-kubernetes.service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging | 
cloud-provider-kubernetes.service.loadBalancerIP | LoadBalancer service IP address
cloud-provider-kubernetes.dockerSecretFile |  Content of a file containing secrets for private docker repository (via --set-file) |
cloud-provider-kubernetes.nodeSelector| Node labels for pod assignment| {}
cloud-provider-kubernetes.tolerations| CloudProviderKubernetes toleration labels for pod assignment| []
cloud-provider-kubernetes.affinity| CloudProviderKubernetes affinity labels for pod assignment|{}
cloud-provider-kubernetes.resources| CloudProviderKubernetes custom resource configuration for the CloudProviderKubernetes pod | {}
cloud-provider-kubernetes.logLevel| CloudProviderKubernetes Log level of the  ( debug, info, warn, error | debug

### CloudService
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
cloud-service.replicaCount | Number of cloudService replica | 1
cloud-service.image.registry| Define the registry where the cloudService is stored | docker.io
cloud-service.image.repository | CloudService docker image | panosc/cloud-service
cloud-service.image.pullPolicy | CloudService image pull policy | Always
cloud-service.image.dockerTag | CloudService docker tag | 1.0.0
cloud-service.service.type | Kubernetes Service type | ClusterIP
cloud-service.service.apiPort | Service API port | 3000
cloud-service.service.nodePorts.api | NodePort for the api | 
cloud-service.service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging | 
cloud-service.service.loadBalancerIP | LoadBalancer service IP address 
cloud-service.service.nodePorts.api | CloudService NodePort for the api | 32301
cloud-service.service.nodePorts.nodeJSDebug | (optional) CloudService NodePort for nodeJS debugging 
cloud-service.nodeSelector| CloudService node labels for pod assignment| {}
cloud-service.tolerations| CloudService toleration labels for pod assignment| []
cloud-service.affinity| CloudService affinity labels for pod assignment|{}
cloud-service.resources| CloudService custom resource configuration | {}
cloud-service.logLevel| CloudService log level ( debug, info, warn, error | debug

### DesktopService
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
desktop-service.replicaCount | Number of desktopService replica | 1
desktop-service.image.registry| Define the registry where the desktopService is stored | docker.io
desktop-service.image.repository | DesktopService docker image | panosc/desktop-service
desktop-service.image.pullPolicy | DesktopService image pull policy | Always
desktop-service.image.dockerTag | DesktopService docker tag | 1.0.0
desktop-service.service.type | Kubernetes Service type | ClusterIP
desktop-service.service.apiPort | Service API port | 8085
desktop-service.service.socketPort | Service socket port | 8087
desktop-service.service.nodePorts.api | NodePort for the api | 
desktop-service.service.nodePorts.socket | NodePort for the web socket | 
desktop-service.service.loadBalancerIP | LoadBalancer service IP address
desktop-service.webServerHost | Hostname of the WebServer (ie Apache, Nginx) | 
desktop-service.nodeSelector| DesktopService node labels for pod assignment| {}
desktop-service.tolerations| DesktopService toleration labels for pod assignment| []
desktop-service.affinity| DesktopService affinity labels for pod assignment|{}
desktop-service.resources| DesktopService custom resource configuration  | {}
desktop-service.logLevel| DesktopService log level ( debug, info, warn, error | debug

### AccountService
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
account-service.replicaCount | Number of accountService replica | 1
account-service.image.registry| Define the registry where the accountService is stored | docker.io
account-service.image.repository | AccountService docker image | panosc/account-service
account-service.image.pullPolicy | AccountService image pull policy | Always
account-service.image.dockerTag | AccountService docker tag | 1.0.0
account-service.service.type | Kubernetes Service type | ClusterIP
account-service.service.apiPort | Service API port | 3000
account-service.service.nodePorts.api | NodePort for the api | 
account-service.service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging |
account-service.idp.url | URL to the OpenID discovery endpoint (eg https://server.com/.well-known/openid-configuration) |
account-service.idp.clientId | Client id referenced in your Identity Provider to use for the accountService |
account-service.idp.loginField | Field in your Identity Provider used for login |
account-service.idp.attributeProviderFile | File containing attribute for the Identity Provider
account-service.idp.attributeProviderConfigMap | ConfigMap name containing attribute for the Identity Provider
account-service.defaultRoleId | Id of the role used for the default user | 1
account-service.nodeSelector| AccountService node labels for pod assignment| {}
account-service.tolerations| AccountService toleration labels for pod assignment| []
account-service.affinity| AccountService affinity labels for pod assignment|{}
account-service.resources| AccountService custom resource configuration  | {}
account-service.logLevel| AccountService log level ( debug, info, warn, error | debug

### ApiService
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
api-service.replicaCount | Number of apiService replica | 1
api-service.image.registry| Define the registry where the apiService is stored | docker.io
api-service.image.repository | ApiService docker image | panosc/api-service
api-service.image.pullPolicy | ApiService image pull policy | Always
api-service.image.dockerTag | ApiService docker tag | 1.0.0
api-service.service.type | Kubernetes Service type | ClusterIP
api-service.service.apiPort | Service API port | 3000
api-service.service.nodePorts.api | NodePort for the api | 
api-service.service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging |
api-service.nodeSelector| ApiService node labels for pod assignment| {}
api-service.tolerations| ApiService toleration labels for pod assignment| []
api-service.affinity| ApiService affinity labels for pod assignment|{}
api-service.resources| ApiService custom resource configuration  | {}
api-service.logLevel| ApiService log level ( debug, info, warn, error | debug


### Global
 Value | Definition | Default
 ------------- | ------------- |  ------------- | 
global.database.host| Database hostname | 
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
global.database.desktopService.username| Username to access the desktopService microservice database | desktop-service
global.database.desktopService.password| Password to access the desktopService microservice database 
global.database.desktopService.databaseName| Database name for the desktopService microservice | desktop-service
global.database.desktopService.schema| Database schema for the desktopService microservice (if definable) | desktop-service
global.database.accountService.username| Username to access the accountService microservice database | account-service
global.database.accountService.password| Password to access the accountService microservice database 
global.database.accountService.databaseName| Database name for the accountService microservice | account-service
global.database.accountService.schema| Database schema for the accountService microservice (if definable) | account-service
global.kubernetesMasterHostname | Hostname or ip of the kubernetes master node |
global.apiService.host | Hostname of the apiService | api-service
global.apiService.port | Port of the webApi for the apiService | 3000
global.cloudService.host | Hostname of the apiService | api-service
global.cloudService.port | Port of the webApi for the apiService | 3000

## Implementation
The PaNOSC Portal integrate the following charts: 

#### [Cloud Provider Kubernetes](../cloud-provider-kubernetes/README.md)

#### [Cloud Service](../cloud-service/README.md)

#### [Desktop Service](../desktop-service/README.md)

#### [Account Service](../account-service/README.md)

#### [API Service](../api-service/README.md)




## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

17/08/2019 :
This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) and [Cloud Service](https://github.com/panosc-portal/cloud-service) microservices. 


06/04/2019:
These microservices have been added to the portal:

- [Account Service](https://github.com/panosc-portal/account-service)
- [API Service](https://github.com/panosc-portal/api-service)
- [Desktop Service](https://github.com/panosc-portal/desktop-service)
