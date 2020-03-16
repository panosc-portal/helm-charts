Cloud Service
=========================  
  
## Description  
The Cloud Service is a microservice that acts as a proxy to the different Cloud Providers.

To use this service, you can clone the project  [Cloud Service CLI Client](https://github.com/panosc-portal/cloud-service-client-cli).  

## Add a provider
After you have installed the CLI, move to it's directory and run the next command to add a provider.  

```  
./bin/run provider:add -u http://<kubernetesMasterAddress>:32301  
```  

Here you will have to name your provider and enter the base URL for it.<br/>
If you are using the CloudProviderKubernetes you will have to enter the folowing URL 
```
http://cloud-provider-kubernetes:3000/api/v1
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