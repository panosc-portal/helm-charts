PaNOSC Portal Demo
====================

This is a demo version of the PaNOSC Portal.

The goal of this project is to provide an easy way of deploying and testing the PaNOSC Portal. This version has a minimum of prerequisites and comes with a database of 
example values to allow users to test without having to define the different objects needed for the portal (example: Images, Flavours ... ).
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)
- A identity provider that uses OpenID Connect

Note: Instead of deploying a kubernetes cluster, you can use docker desktop on Mac or Windows. 
In that case, you have to use your localhost IP address for all connection to a container
instead of the displayed IP

## Installation
To install the PaNOSC Portal Demo chart, add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you can run the helm install command followed by: 
- The hostname of your Kubernetes mater node
- The URL to the OpenID discovery endpoint of your IDP
- The Client ID configured in your OpenID provider 
- The attribute name in your IDP providing that is used for login 

You can also specify a existent namespace with the flag -n if you dont want to install the cart in the default namespce
```
helm install <YourReleaseName> panosc-portal/panosc-portal-demo \
--set cloud-provider-kubernetes.kubernetesMasterHostname=k8sMaster.panosc.eu \
--set account-service.idp.url=https://server.com/.well-known/openid-configuration \
--set account-service.idp.clientId=panosc \
--set account-service.idp.loginField=user \
-n panosc-portal
```


## Uninstall the Chart
```
helm uninstall <YourReleaseName> -n panosc-portal
```
If you install your Chart in the default namespace, the flag -n is not needed


## Use the portal

### Manage instances
To use the portal, you first need to clone the [API Service CLI Client](https://github.com/panosc-portal/api-service-client-cli)
and add a config.json file at the root of the project with the following structure:
```
{
  "idp": {
    "url": "https://idp.com/auth/url/to/obtain/token",
    "clientId": "a_client_id"
  }
}
```
After entering your first command, you will be asked to insert your username and password. A token will then be saved in the file token.json 

You can then use the following commands to:

- Add a user instance:
```
bin/run user-instance:add -u http://<KubernetesMasterNode>:32306/portal
```

- List user instances:
```
bin/run user-instance:list -u http://<KubernetesMasterNode>:32306/portal
```

- Get a user instance:
```
bin/run user-instance:get -u http://<KubernetesMasterNode>:32306/portal
```

- Stop/start/reboot a user instance:
```
bin/run user-instance:stop -u http://<KubernetesMasterNode>:32306/portal
bin/run user-instance:start -u http://<KubernetesMasterNode>:32306/portal
bin/run user-instance:reboot -u http://<KubernetesMasterNode>:32306/portal
```

- Delete a user instance:
```
bin/run user-instance:delete -u http://<KubernetesMasterNode>:32306/portal
```

- Generate a user instance access token:
```
bin/run user-instance:token -u http://<KubernetesMasterNode>:32306/portal
```



### Access instances
#### Remote Desktop
When the instance is in an active state you can access it with the following url :
```
http://<KubernetesMasterNode>:32407/instances/{instanceId}?token={token}
```
You can get the instance id with the 'add' or 'list' command and create a access token with the 'token' command 

#### Jupyter notebook 
The notebooks are accessible by using the given hostname and HTTP port with the 'list' command  

## Database access
All the databases of the portal can be access with the following information:  
```  
host: <kubernetesMasterAddress>
port: 32400
username: postgres
```

## Integration
The PaNOSC Portal Demo integrate the following charts: 

#### [Cloud Provider Kubernetes](../cloud-provider-kubernetes/README.md)

#### [Cloud Service](../cloud-service/README.md)

#### [Desktop Service](../desktop-service/README.md)

#### [API Service](../api-service/README.md)

#### [PaNosc Postgres](../panosc-postgres/README.md)

#### [Desktop Service Web Test Client](../desktop-service-web-test-client/README.md)

#### [Apache](https://github.com/bitnami/charts/tree/master/bitnami/apache)
 
## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

16/03/2019 :

This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) and [Cloud service](https://github.com/panosc-portal/cloud-service) microservice and a PostgreSQL database with the example data.
 
01/04/2019:

These microservices have been added to the portal:

- [Account Service](https://github.com/panosc-portal/account-service)
- [API Service](https://github.com/panosc-portal/api-service)
- [Desktop Service](https://github.com/panosc-portal/desktop-service)

The portal also deploys a Apache chart to act as a reverse proxy and a [desktop service web test client](https://github.com/panosc-portal/desktop-service-web-test-client) to access the remote desktop instances.
