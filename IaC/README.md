## Overview

Microsoft official Terraform samples are [available here](https://learn.microsoft.com/en-us/azure/developer/terraform/configure-azure-virtual-desktop)

While they are a great starters for the initial deployment, scenario such as setting up a new host pool in an existing Azure Virtual network with a Active Directory domain join is not covered currently. 

This perticular scenario could be very helpful for just deploying new pools as required or perhaps during a Disaster Recovery situation.

One of the great thing about Infra as a code is being able to levarage the community contents. Full disclosure, I did not write this sample from the scratch. Reused few samples from the community and updated accordingly to fit the purpose.

Path to modules https://github.com/ravibak/AVD/tree/main/workload/terraform/ExistingADandVNET



There are few small but important details.
- Sensitive variables such as password are stored in variable files in this example, but it is strongly recommended against. As of this writing, I was still learning Terraform/IaC so could not find a way to call secrets using a key vault for example. (or I was lazy :)).

- As with any Terraform based automation, main and variable state file used here along with a .tfvars which is additional area to set variable.

- Host Pool Metadata locations are only supported to be in certain regions only. In this case, Host Pool Metadata is stored in eastus and session host VMs are deployed in southeastasia. As such, pay attention to different location and resource group for Host Pool and Session Hosts.

- Pay attention to block named "data" for referring existing Azure vNet.

```terraform
data "azurerm_subnet" "subnet" {
  name                 = "Subnet1"
  virtual_network_name = "VNETNAME"
  resource_group_name  = "VNETRGNAME"
}
```


If you are experienced with Terraform, you would know the drill but if not, here are the series of commands (once you copy the state files in a folder)

I have used a Windows PC running PowerShell 7
Downloaded and extracted Terraform. Set the path in Environmental Variables.

az login

If you have multiple subscriptions and need to choose a specific one then,

az account show

az account set --subscription "xxxxxx-xxx-xxx-xfxf-x30xf5x85b4"

terraform init -upgrade
 
terraform plan -out main.tfplan
 
terraform apply main.tfplan



