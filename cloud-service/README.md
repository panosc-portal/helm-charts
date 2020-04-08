Cloud Service
=========================  
  
## Description  
The Cloud Service is a microservice that acts as a proxy to the different Cloud Providers.

# Install the Chart
To install the Cloud Service chart add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have set the database hostname, type(if not postgres), user and password by copying and modifying the values.yaml file and enter the following command:
```
helm install my-release panosc-portal/cloud-service \
-f myvalues.yaml -n <existantNamespace>
```
or by setting the values that you want to modify with the flag --set:
```
helm install my-release panosc-portal/cloud-service \
--set global.database.host=database.panosc.eu \
--set global.database.cloudPoviderKubernetes.username=test \
--set global.database.cloudPoviderKubernetes.password=password \
-n <existantNamespace>
```

# Upgrade the Chart
After installing the chart, you can upgrade it to a new version or, change your values.

You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade my-release panosc-portal/cloud-service \
 -f myvalues.yaml -n <releaseNamespace>
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade my-release panosc-portal/cloud-service \
--set service.nodePorts.nodeJSDebug=32402 \
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
replicaCount | Number of CloudService replica | 1
image.registry| Define the registry where the CloudService is stored | docker.io
image.repository | CloudService docker image | panosc/cloud-service
image.dockerTag | CloudService docker tag |testing
image.pullPolicy | Image pull policy | Always
service.type | Kubernetes Service type | ClusterIP
service.apiPort | Service API port | 3000
service.nodePorts.api | NodePort for the api | 
service.nodePorts.nodeJSDebug |  NodePort for nodeJS debugging | 
service.loadBalancerIP | LoadBalancer service IP address 
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the cloudService pod | {}
logLevel| Log level of the cloudService ( debug, info, warn, error | debug
global.database.host| Database hostname | 
global.database.port| Database port | 5432
global.database.type| Database type (oracle, postgres, mariadb ...) | postgres
global.database.log| Boolean to activate or not database logs | false
global.database.sync| Boolean to activate or not database synchronisation | false
global.database.cloudService.username| Username to access the cloudService microservice database
global.database.cloudService.password| Password to access the cloudService microservice database 
global.database.cloudService.databaseName| Database name for the cloudService microservice | cloud-service
global.database.cloudService.schema| Database schema for the cloudService microservice (if definable) | cloud-service


# Use the service
To use this service, you can clone the project  [Cloud Service CLI Client](https://github.com/panosc-portal/cloud-service-client-cli) with the latest version (found under the releases tab of github):.  
```
git clone --branch <\BranchNumber> --depth 1 https://github.com/panosc-portal/cloud-provider-client-cli.git. 
```

## Add a provider
After you have installed the CLI, move to it's directory and run the next command to add a provider.

```
./bin/run provider:add -u http://<kubernetesMasterAddress>:32301
```

Here you will have to name your provider and enter the base URL for it.<br/>
If you are using the CloudProviderKubernetes you will have to enter the folowing URL 
```
http://cloud-service:3000/api/v1
```

## Create a plan
A Plan is a combination of an Image and a Flavour originating from a single provider.

Before creating an instance, you need to create a plan with the following command.
```  
./bin/run plan:add -u http://<kubernetesMasterAddress>:32301  
```

Here you will have to choose the provider you want to create a plan from, enter the name the of the new plan and then choose the image and the flavour. 

## Create an instance   
You can then create an instance with the following command: 
```  
./bin/run instance:add -u http://<kubernetesMasterAddress>:32301  
```  
You will then be able to choose the Plan (Image + Flavour) you want for your instance <br/>  
  
### List all the created instances:  
  
Next you can follow the status of your instance by running the next command:  
```  
./bin/run instance:list -u http://<kubernetesClusterAddress>:32301 
```  
Here you will also be able to see the hostname for your instance (witch should be the hostname of you kubernetes master node)   
and the protocol used on that instance with the exposed port number.  