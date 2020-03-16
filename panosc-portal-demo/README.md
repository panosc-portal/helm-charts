PaNOSC Portal Demo
====================

This is a demo version of the PaNOSC Portal.

The goal of this project is to provide an easy way of deploying and testing the PaNOSC Portal. This version has a minimum of prerequisites and comes with a database of 
example values to allow users to test without having to define the different objects needed for the portal (example: Images, Flavours ... ).
The whole architecture of the portal is documented at the following address: https://confluence.panosc.eu/display/wp4/Common+Portal+Design.

## Requirements :
- A kubernetes cluster with Helm 3 (see https://helm.sh/docs/intro/install/)

Note: Instead of deploying a kubernetes cluster, you can use docker desktop on Mac or Windows. 
In that case, you have to use your localhost IP address for all connection to a container
instead of the displayed IP

## Installation
To install the PaNOSC Portal Demo chart, add the panosc-portal repository to your helm client with the following command:
```
helm repo add panosc-portal https://panosc-portal.github.io/helm-charts/
```

Then you can run the helm install command followed with the name you want to call it:
```
helm install <YourReleaseName> ./panosc-portal-demo-chart
```

You can then find the kubernetes services and pods in the namespace panosc-portal.

## Uninstall  
To uninstall all the kubernetes 
```
helm uninstall <YourReleaseName>
```
Note: If you want to reinstall it afterwards, you will have to wait a couple of minutes for all the kubernetes namespaces to be deleted

## Database access
All the databases of the portal can be access with the following information:  
```  
host: <kubernetesMasterAddress>
port: 32400
username: postgres
```

## Documentation

#### [Cloud Provider Kubernetes](../cloud-provider-kubernetes/README.md)


## Status

The deployment of the portal will be continually updated when new microservices are added. The current status is shown below.

16/03/2019 :

This project will deploy the  [Cloud Provider Kubernetes](https://github.com/panosc-portal/cloud-provider-kubernetes) microservice and a PostgreSQL database with the example data. 
