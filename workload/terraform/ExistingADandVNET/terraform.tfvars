# Customized the sample values below for your environment and either rename to terraform.tfvars or env.auto.tfvars

prefix               = "avdtf"
local_admin_username = "localadm"
local_admin_password = "ChangeMe123$"
aad_group_name       = "WVDDesktopFinPool"
domain_name          = "contoso.local"
domain_user_upn      = "domainjoinadmin"     # do not include domain name as this is appended
domain_password      = "domainjoinadminpassword"
hostpool            = "AVD-TF-HP" # Change accordingly. 
avd_users = [
  "finuser1@ftclabs.com",
  "finuser2@ftclabs.com"
]

# I was expecting avd_users will be assigned to the AVD Workspace/App Group but it did not work.
