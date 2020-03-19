Desktop Service
=========================  
  
## Description  
The Desktop Service is a microservice that acts as a relay between the guacd service on a running instance and a web-socket to the browser client.

# Install the Chart
To install the Desktop Service chart add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have set the database hostname, user and password by copying and modifying the values.yaml file and enter the following command:
```
helm install -f myvalues.yaml my-release panosc-portal/desktop-service
```
or by setting the values that you want to modify with the flag --set:
```
helm install --set global.database.host=database.panosc.eu  --set global.database.desktopService.username=test --set global.database.desktopService.password=password my-release panosc-portal/desktop-service
```

# Upgrade the Chart
After installing the chart, you can upgrade it to a new version or, change your values.

You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade -f myvalues.yaml my-release panosc-portal/desktop-service
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade --set panoscPortal.namespace=panosc-portal my-release panosc-portal/desktop-service
```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information

# Uninstall the Chart
```
helm uninstall my-release
```

# Chart values
Value | Definition | Default
 ------------- | ------------- | ------------- | 
replicaCount | Number of desktopService replica | 1
image.registry| Define the registry where the desktopService is stored | docker.io
image.repository | DesktopService docker image | panosc/desktop-service
image.dockerTag | DesktopService docker tag | testing
image.pullPolicy | Image pull policy | IfNotPresent
service.nodePorts.api | NodePort for the api | 32302
service.nodePorts.socket | NodePort for the web socket | 32403
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the cloudService pod | {}
global.namespace.name | Name of namespace in witch the microservice will be installed (namespace must be already created) | default
global.database.host| Database hostname | panosc-postgres
global.database.port| Database port | 5432
global.database.type| Database type (oracle, postgres, mariadb ...) | postgres
global.database.log| Boolean to activate or not database logs | false
global.database.sync| Boolean to activate or not database synchronisation | false
global.database.cloudService.username| Username to access the desktopService microservice database
global.database.cloudService.password| Password to access the desktopService microservice database 
global.database.cloudService.databaseName| Database name for the desktopService microservice | desktop-service
global.database.cloudService.schema| Database schema for the desktopService microservice (if definable) | desktop-service
