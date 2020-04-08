API Service
==========================

The API Service is a microservice that provides a main point of entry to the application and facade to APIs of underlying micro services.

# Install the Chart
To install the API Service chart add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have set the database hostname, type (if not postgres), user and password by copying and modifying the values.yaml file and enter the following command:
```
helm install my-release panosc-portal/api-service \
-f myvalues.yaml -n <existantNamespace>
```
or by setting the values that you want to modify with the flag --set:
```
helm install my-release panosc-portal/api-service \
--set global.database.host=database.panosc.eu \
--set global.database.apiService.username=test \
--set global.database.apiService.password=password \
-n <existantNamespace>
```

# Upgrade the Chart
After installing the chart, you can upgrade it to a new version or, change your values.

You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade my-release panosc-portal/api-service \
 -f myvalues.yaml -n <releaseNamespace>
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade my-release panosc-portal/api-service \
--set service.nodePorts.api=32306 \
-n <releaseNamespace>

```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information

# Uninstall the Chart
```
helm uninstall my-release --namespace <releaseNamespace>
```

# Chart values
Value | Definition | Default
 ------------- | ------------- | ------------- | 
replicaCount | Number of apiService replica | 1
image.registry| Define the registry where the apiService is stored | docker.io
image.repository | apiService docker image | panosc/api-service
image.dockerTag | apiService docker tag | testing
image.pullPolicy | Image pull policy | Always
service.type | Kubernetes Service type | ClusterIP
service.apiPort | Service API port | 3000
service.nodePorts.api | NodePort for the api | 
service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging | 
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the apiService pod | {}
logLevel| Log level of the apiService ( debug, info, warn, error | debug
global.apiService.host | Hostname of the apiService | api-service
global.apiService.port | Port of the webApi for the apiService | 3000
global.cloudService.host | Hostname of the apiService | api-service
global.cloudService.port | Port of the webApi for the apiService | 3000


# Use the service
To use this service, you can clone the project  [PaNOSC Account Service CLI Client](https://github.com/panosc-portal/api-service-client-cli) 

# Database Tables
See the database model in the confluence documentation https://confluence.panosc.eu/display/wp4/Common+Portal+-+Cloud+Provider

