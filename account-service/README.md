Account Service
==========================

The Account Service is a microservice that can be used to authenticate and authorise a user and return a User object with relevant attributes.  
  
# Install the Chart
To install the Account Service chart add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have set the database hostname, type, user and password by copying and modifying the values.yaml file and enter the following command:
```
helm install -f myvalues.yaml my-release panosc-portal/account-service
```
or by setting the values that you want to modify with the flag --set:
```
helm install --set global.database.host=database.panosc.eu  --set global.database.accountService.username=test --set global.database.accountService.password=password my-release panosc-portal/account-service
```

# Upgrade the Chart
After installing the chart, you can upgrade it to a new version or, change your values.

You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade -f myvalues.yaml my-release panosc-portal/account-service
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade --set panoscPortal.namespace=panosc-portal --set cloudProviderKubernetes.instancesNamespace=panosc-instances my-release panosc-portal/account-service
```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information

# Uninstall the Chart
```
helm uninstall my-release
```

# Chart values
Value | Definition | Default
 ------------- | ------------- | ------------- | 
replicaCount | Number of accountService replica | 1
image.registry| Define the registry where the accountService is stored | docker.io
image.repository | accountService docker image | panosc/account-service
image.dockerTag | accountService docker tag | testing
image.pullPolicy | Image pull policy | IfNotPresent
service.nodePorts.api | NodePort for the api | 32304
service.nodePorts.nodeJSDebug | (optional) NodePort for nodeJS debugging | 32405
namespace.instances.creation | Boolean to create or not the instances namespace | true
namespace.instances.name| Name of the instances namespace | panosc-instances 
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the CloudProviderKubernetes pod | {}
logLevel| Log level of the CloudProviderKubernetes ( debug, info, warn, error | debug
global.namespace.name | Name of namespace in witch the microservice will be installed (namespace must be already created) | default
global.database.host| Database hostname | 
global.database.port| Database port | 5432
global.database.type| Database type (oracle, postgres, mariadb ...) | postgres
global.database.log| Boolean to activate or not database logs | false
global.database.sync| Boolean to activate or not database synchronisation | false
global.database.accountService.username| Username to access the accountService microservice database | account-service
global.database.accountService.password| Password to access the accountService microservice database 
global.database.accountService.databaseName| Database name for the accountService microservice | account-service
global.database.accountService.schema| Database schema for the accountService microservice (if definable) | account-service


# Use the service
To use this service, you can clone the project  [PaNOSC Account Service CLI Client](https://github.com/panosc-portal/account-service-client-cli) 

# Database Tables
See the database model in the confluence documentation https://confluence.panosc.eu/display/wp4/Common+Portal+-+Cloud+Provider

