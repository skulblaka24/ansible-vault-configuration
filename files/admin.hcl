# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# To enable secrets engines
path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# Manage userpass auth method
path "auth/userpass/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List, create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "read", "update", "delete"]
}

# Create and manage entities and groups
path "identity/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Setting up test data
path "restricted/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
