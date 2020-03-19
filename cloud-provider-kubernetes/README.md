Cloud Provider Kubernetes
==========================

The Cloud Provider Kubernetes is a microservice that allows to create instances on a kubernetes cluster.  
  
# Install the Chart
To install the Cloud Provider Kubernetes chart add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you will have set the database hostname, type, user and password by copying and modifying the values.yaml file and enter the following command:
```
helm install -f myvalues.yaml my-release panosc-portal/cloud-provider-kubernetes
```
or by setting the values that you want to modify with the flag --set:
```
helm install --set global.database.host=database.panosc.eu  --set global.database.cloudProviderKubernetes.username=test --set global.database.cloudProviderKubernetes.password=password my-release panosc-portal/cloud-provider-kubernetes
```

# Upgrade the Chart
After installing the chart, you can upgrade it to a new version or, change your values.

You can ether specify a value file with the flag "-f" followed by the name or URL of the value file :
```
helm upgrade -f myvalues.yaml my-release panosc-portal/cloud-provider-kubernetes
```
or specify the values that you want to modify with the flag --set:
```
helm upgrade --set panoscPortal.namespace=panosc-portal --set cloudProviderKubernetes.instancesNamespace=panosc-instances my-release panosc-portal/cloud-provider-kubernetes
```
See (https://helm.sh/docs/helm/helm_upgrade/) for more information

# Uninstall the Chart
```
helm uninstall my-release
```

# Chart values
Value | Definition | Default
 ------------- | ------------- | ------------- | 
replicaCount | Number of CloudProviderKubernetes replica | 1
image.registry| Define the registry where the CloudProviderKubernetes is stored | docker.io
image.repository | CloudProviderKubernetes docker image | panosc/cloud-provider-kubernetes
image.dockerTag | CloudProviderKubernetes docker tag |testing
image.pullPolicy | Image pull policy | IfNotPresent
service.nodePorts.api | NodePort for the api | 32300
service.nodePorts.nodeJSDebug | (optional) NodePort for nodeJS debugging | 32401
namespace.instances.creation | Boolean to create or not the instances namespace | true
namespace.instances.name| Name of the instances namespace | panosc-instances 
kubernetesRequestHelperFile | Content of a file containing a  kubernetes request helper (via --set-file) |
dockerSecretFile |  Content of a file containing secrets for private docker repository (via --set-file) |
nodeSelector| Node labels for pod assignment| {}
tolerations|Toleration labels for pod assignment| []
affinity|Affinity labels for pod assignment|{}
resources|Custom resource configuration for the CloudProviderKubernetes pod | {}
logLevel| Log level of the CloudProviderKubernetes ( debug, info, warn, error | debug
global.namespace.name | Name of namespace in witch the microservice will be installed (namespace must be already created) | default
global.database.host| Database hostname | panosc-postgres
global.database.port| Database port | 5432
global.database.type| Database type (oracle, postgres, mariadb ...) | postgres
global.database.log| Boolean to activate or not database logs | false
global.database.sync| Boolean to activate or not database synchronisation | false
global.database.cloudProviderKubernetes.username| Username to access the CloudProviderKubernetes microservice database
global.database.cloudProviderKubernetes.password| Password to access the CloudProviderKubernetes microservice database 
global.database.cloudProviderKubernetes.databaseName| Database name for the CloudProviderKubernetes microservice | cloud-provider-kubernetes
global.database.cloudProviderKubernetes.schema| Database schema for the CloudProviderKubernetes microservice (if definable) | cloud-provider-kubernetes


# Use the service
To use this service, you can clone the project  [PaNOSC Cloud Provider CLI Client](https://github.com/panosc-portal/cloud-provider-client-cli) with the latest version (found under the releases tab of github):
```
git clone --branch <\BranchNumber> --depth 1 https://github.com/panosc-portal/cloud-provider-client-cli.git. 
```

## Create an instance   
### Add an instance to the cloud-provider:  
  
After you have installed the CLI, move to it's directory and run the next command to add an instance.  
```  
./bin/run instance:add -u http://<kubernetesMasterAddress>:32300  
```  
You will then be able to choose the image you want for your instance and then the flavour that you want (i.e CPU and RAM)<br/>  
  
Then, enter a name for you new instance.  

### List all the created instances:  
  
Next you can follow the status of your instance by running the next command:  
```  
./bin/run instance:list -u http://<kubernetesClusterAddress>:32300  
```  
Here you will also be able to see the hostname for your instance (witch should be the hostname of you kubernetes master node)   
and the protocol used on that instance with the exposed port number.  
  

# Database Tables
See the database model in the confluence documentation https://confluence.panosc.eu/display/wp4/Common+Portal+-+Cloud+Provider

# Kubernetes request helper file 
The Kubernetes request helper is a file where you can define methods to  add specific volumes or environment variables to an instance that cannot be defined in the database (example user home path).
For this, you need to create a file that has a getVolumes and getEnvsVars function that will return the necessary volume and environment variable for a specific image.
[see example file](k8s-request-helper-example.js)<br/>
Then use the parameter --set-file cloudProviderKubernetes.kubernetesRequestHelperFile=PathToFile while installing or upgrading the helm chart.


# Docker registry secret file
The Cloud provider Kubernetes allows you to create instances using images from a private repository.
If you need to use credentials to connect to it, you need to create a file where you will define an array of maps with the attributes repository, username and password 
[see example file](docker-repo-secrets-example.json).<br/>
Then use the parameter --set-file cloudProviderKubernetes.dockerSecretFile=PathToFile while installing or upgrading the helm chart.


