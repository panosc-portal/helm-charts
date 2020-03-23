API Service
==========================

The API Service is a microservice that provides a main point of entry to the application and facade to APIs of underlying micro services.

# Install the Chart
To install the API Service chart add the panosc-portal repository to your helm client with the following command:
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
image.pullPolicy | Image pull policy | Always
service.nodePorts.api | NodePort for the api | 32304
service.nodePorts.nodeJSDebug | (optional) NodePort for nodeJS debugging | 32405
idp.host | Hostname of your Identity Provider |
idp.clientId | Client id referenced in your Identity Provider to use for the Account Service |
idp.loginField | Field in your Identity Provider used for login |
idp.attributeProviderFile | File containing attribute for the Identity Provider
defaultRoleId | Id of the role used for the default user | 1
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the accountService pod | {}
logLevel| Log level of the accountService ( debug, info, warn, error | debug
global.namespace.name | Name of namespace in witch the microservice will be installed (namespace must be already created) | default
global.accountService.host | Hostname of the accountService | account-service
global.accountService.port | Port of the webApi for the accountService | 3000
global.cloudService.host | Hostname of the apiService | api-service
global.cloudService.port | Port of the webApi for the apiService | 3000


# Use the service
To use this service, you can clone the project  [PaNOSC Account Service CLI Client](https://github.com/panosc-portal/account-service-client-cli) 

# Database Tables
See the database model in the confluence documentation https://confluence.panosc.eu/display/wp4/Common+Portal+-+Cloud+Provider

