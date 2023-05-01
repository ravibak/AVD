variable "resource_group_location" {
default     = "eastus"
description = "Location of the resource group for Host Pool Metadata location."
}

variable "resource_group_location_rg" {
default     = "southeastasia"
description = "Location of the resource group for session hosts Virtual Machines."
}

# Change the RG name accordingly.
variable "rg_name" {
type        = string
default     = "rg-avd-resources"
description = "Name of the Resource group for storing Host Pool resources"
}

# Change the name of the workspace accordingly.
variable "workspace" {
type        = string
description = "Name of the Azure Virtual Desktop workspace"
default     = "AVD TF Workspace"
}

# Change the name of the Host Pool accordingly.
variable "hostpool" {
type        = string
description = "Name of the Azure Virtual Desktop host pool"
default     = "AVD-TF-HP"
}

# Change value to something in future of 1 hour to 28 days from the time of executing the plan (UTC Time zone)
variable "rfc3339" {
type        = string
default     = "2023-05-02T2:43:13Z"
description = "Registration token expiration"
}

# Change the prefix name accordingly.
variable "prefix" {
type        = string
default     = "avdtf"
description = "Prefix of the name of the AVD machine(s)"
}

# Change the RG name accordingly.
variable "rg" {
  type        = string
  default     = "rg-avd-compute"
  description = "Name of the Resource group it store Session host VM resources"
}

variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
  default     = 2
}

variable "domain_name" {
  type        = string
  default     = "contoso.local"
  description = "Name of the domain to join"
}

variable "domain_user_upn" {
  type        = string
  default     = "domainjoinadminusername" # do not include domain name as this is appended
  description = "Username for domain join"
}

variable "domain_password" {
  type        = string
  default     = "domainjoinadminpassword"
  description = "Password of the user to authenticate with the domain"
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the machine to deploy"
  default     = "Standard_DS2_v2"
}

variable "ou_path" {
  default = ""
}

variable "local_admin_username" {
  type        = string
  default     = "localadm"
  description = "local admin username"
}

variable "local_admin_password" {
  type        = string
  default     = "ChangeMe123!"
  description = "local admin password"
  sensitive   = true
}

#Change the name to reflect actual subnet name.
variable "subnet_id" {
  type        = string
  description = "Azure Subnet ID"
  default = "Subnet1"

}
