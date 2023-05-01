## Overview

Microsoft official Terraform samples for Azure Virtual Dekstop are [available here](https://learn.microsoft.com/en-us/azure/developer/terraform/configure-azure-virtual-desktop).

While they are a great starters for the initial deployment, scenario such as setting up a new host pool in an existing Azure Virtual network with a Active Directory domain join is not covered currently. 

This perticular scenario could be very helpful for just deploying new pools as required or perhaps during a Disaster Recovery situation.

One of the great thing about Infra as a code is being able to levarage the community contents. Full disclosure, I did not write this sample from the scratch. Reused major portion of the code from  community and updated accordingly to fit the purpose.

[Path to modules](https://github.com/ravibak/AVD/tree/main/IaC/terraform/ExistingADandVNET)



There are few important things to note.

- Sensitive variables such as password are stored in variable files in this example, but it is strongly recommended against. As of this writing, I was still learning Terraform/IaC so could not find a way to call secrets using a key vault for example. (or I was lazy :)).

- As with any Terraform based automation, main and variable state file used here along with a .tfvars which is additional area to set variable.

- AVD Host Pool Metadata locations are supported to be deloyed in certain Azure regions only. In this sample, Host Pool Metadata is stored in eastus and session host VMs are deployed in southeastasia. As such, pay attention to different location and resource group for Host Pool and Session Hosts.

- Pay attention to block named "data" for referring existing Azure vNet.

- I have used a marketplace image, please replace the image referenece if you are using a custom image. 



```terraform
data "azurerm_subnet" "subnet" {
  name                 = "Subnet1"
  virtual_network_name = "VNETNAME"
  resource_group_name  = "VNETRGNAME"
}
```
## Terraform Setup

If you are experienced with Terraform, you  know the drill.
This sample takes a very basic approach of setting up the environment but you could explore avenues like remote location for state file (Azure Strage) and or deploy the code using DevOps pipelines. 

Here are the series of commands (once you copy the state files in a folder)

I have used a Windows PC running PowerShell 7
Install Terraform. 
Download the configuration files from this repo to a local folder. 
Execute these commands.

```sh
az login
```

If you have multiple subscriptions and need to choose a specific one then,

```sh
az account show

az account set --subscription "xxxxxx-xxx-xxx-xfxf-x30xf5x85b4"

terraform init -upgrade
 
terraform plan -out main.tfplan
 
terraform apply main.tfplan
```

## Issues

- Few things such as credentials are stored as variable in two place, there is need for improvements. It appears terraform.tfvars variables are preferred. 

- User/Group assignment to AVD Application Group/workspace did not work. Need to manually assign them. 

- Template is using a Built-in Market place image, you may want to replace it with any custom image to cater needs such as custom apps, FSLogix agents etc. 


