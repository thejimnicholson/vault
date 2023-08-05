path "kv/*" {
  capabilities = ["create", "read", "update", "patch", "delete", "list"]
}

path "auth/userpass/users/*" {
  capabilities = ["update"]
  allowed_parameters = {
    "password" = []
  }
}

path "sys/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}