# AVD

This repo contains a tested module of Terraform to help automate a deployment of a new Azure Virtual Dekstop Host Pool along with the other backend AVD configuration such as workspace/app pool. Plus more importantly being able to deploy AVD session hosts in an existing Virtual Network and join to an Active Directory Domain (Domain Controllers running in a peered vnet where the session hosts would be placed at)

Sensitive variables such as password are stored in variable files in this example but it is strongly recommended against. As of this writing, I was still learning Terraform/IaC so could not find a way to call secrets using a key vault for example. (or I was lazy :)).

There are few small but important details.

As with any Terraform based automation, main and variable state file used here along with a .tfvars which is additional area to set variable.

Host Pool Metadata locations are only supported to be certain regions. In this case, Host Pool Metadata is stored in eastus and session host VMs are deployed in southeastasia. 

As such, pay attention to different location and resource group for Host Pool and Session Hosts.

Pay attention to block named "data" for referring existing Azure vNet.

data "azurerm_subnet" "subnet" {
  name                 = "Subnet1"
  virtual_network_name = "VNETNAME"
  resource_group_name  = "VNETRGNAME"
}



