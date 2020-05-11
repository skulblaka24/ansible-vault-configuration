# AppRole for Terraform Vault provider authentication
export TF_VAR_app_role_mount_point="approle"
export TF_VAR_role_name="terraform"
export TF_VAR_role_id=""
export TF_VAR_secret_id=""

# Namespace
export TF_VAR_namespace="marketing"

# Policy
export TF_VAR_policy_name="k8s"
export TF_VAR_policy_code=$(cat <<EOF
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "secret/data/apikey" {
  capabilities = ["read","list"]
}
path "db/creds/dev" {
  capabilities = ["read"]
}
path "pki_int/issue/*" {
  capabilities = ["create", "update"]
}
path "sys/leases/renew" {
  capabilities = ["create"]
}
path "sys/leases/revoke" {
  capabilities = ["update"]
}
path "sys/renew/*" {
  capabilities = ["update"]
}
EOF
)

# KV
export TF_VAR_kv_path="kv"

# Kubernetes
#export TF_VAR_k8s_path="k8s"
#export TF_VAR_kubernetes_host=""
#export VAULT_SA_NAME=$(kubectl get sa vault-auth -o jsonpath="{.secrets[*]['name']}")
#export TF_VAR_token_reviewer_jwt=$(kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo)
#export TF_VAR_kubernetes_ca_cert=$(kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo)

# GCP Auth backend
export TF_VAR_gcp_credentials=$(cat <<EOF
{
  "type": "service_account",
  "project_id": "starfly",
  "private_key_id": "2c31fa49e867eda701fa754b2fd55b5ce40562a5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbpHOzaxf01brg\n0U2U3bGjywR5eXl1+JUAOEijtRc3rvRa6vxh+Nh+6pkts31tq7tTlvy9MUWoT7vY\n7/aLk6TmRGTTzmAwbFLUigUOATKPuNZ3nxPd+nzP/Z+DdkhHTPYgQjSt4Y4lxchy\nWB5Yx/XbUpHHqj6tG51l4fFyUW1az+AXeSmnyesvT+ENzDBDfAAE87M1ncL1cSkE\nEFJ3IgxICSnYg23XjZC+evtLOAvevM6V9r500eEq/5My9FFXA+XkYzqMSzpmqKLZ\nPMIx3wukzjr1MjLgwOyC6+hnC+FsdAADkfEKNjoZdKTFRV1k7o1hy6/aniVHHehp\nHR3mqv8NAgMBAAECgf8E7oYEobX35EqWwgHC6bXt9k7XpYh7Lqj+XxLNlT+uxHn8\n8joajcbfnohrCMnXwxp1TIm1K3IFpZ3/RbcxFHKTRF1Zg5rsvIlpavywhIGw3hN2\nfLPOHTjV1m9RV7QxcVORMhveOBQC8iy4kYna2s0bh4J95Wbdw+YUz/Mu0wKOaXLM\nF2X6NCYLdkGBhjHUaQ6lzMQVdIT81adGMO4+HJCcTcbLlJrU+K3a1QP+9L43qEp0\n4vYwNbc2rBEELeA3vtkVK5bQy838Ms5aKYcZFaqBs2vf/t3vLhPZspzKFltfLswy\nXTccyIDqy0jJj2xATO0BYzwXP2hG7qFpJ2PJMuECgYEAz5lk/v4UYCFjK2Bqxc67\nI8fsXWMhkRvp92D3NvVnOCGiPmBoOHI7YIcHgkPFb8bqiNTfvPCX/krharP3KRVH\nqr1fsdq9gBe3ThKtpsIHusQ1dks/lwxr57JeSrWRHbEQFEZbug2FU+GK4f9XJcbV\ndJZCd2okpDRNyLIwfxcDi6ECgYEAv+4A6WdmOl538yPlXtPYXh9IfavVZwnxbZv0\nQs7dRyD98t9XFTc/7/wNqu0WYDkz/OZh2vminyV5E1BrFe8Q1Ce6mqsw/pRGVGkc\n5SYtUN2f41mC1HBNL5ReTYKbW4dbA/8kkG+kM1qAOJYaiWzRYacp2bnCLUrGTUwP\nSgnw2+0CgYEAlFQ7r14HXPA+FT4czBz75YLxRYCQ+UeCkjh8Ko6JI7gUXpEvpjUo\na73PBao6pbTw2reO7UbSsuT5zu2rSXVk8X/BoihygdVwKZ566M12DGIo+M6nLtu3\nNaNib+rvNtHOdU4YOAV1IAvk2blBoUJCPb0m3H/Aknq0oROARy5AYEECgYA/OxLz\n0kvcmPjdkorjhdl3kMjaFj1VF/KBEOsVA3/lChp/5FKVO8GFt71s/XTsuIvHGsNM\nWAfadIcB9PGCpWMe8gPJJvMaPBE7h/GsELrHNGyTgw7WHDVhoni7AndaXSqAE5Oh\nPhaTkJJDkjgl5ELK8D6aa1dsgoD4QEGdO88tNQKBgQCLgJVtl2gQxg5yirvBLdXB\nXJXLsPB5508iwsdaTwc8QiafizSDkryhvEF6Pn97lj1KJnqiS8eZmp14bj9yqi/9\nToTmNgYdbrbNF9vofwtFChOPN+5kkgeo+9d6i8GvmYT729CxVtq0ACKRJ1scEFtI\na7Dqzbufz9GmUt1hXpRkIw==\n-----END PRIVATE KEY-----\n",
  "client_email": "terraform@starfly.iam.gserviceaccount.com",
  "client_id": "117289344901054145240",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/terraform%40starfly.iam.gserviceaccount.com"
}
EOF
)
export TF_VAR_gcp_role_name="gce" 
export TF_VAR_gcp_bound_zones='["europe-west1-b"]'
export TF_VAR_gcp_bound_projects='["starfly"]'
export TF_VAR_gcp_token_policies='["terraform"]'
export TF_VAR_gcp_token_ttl=1800
export TF_VAR_gcp_token_max_ttl=86400

# SSH Secret Engine
export TF_VAR_ssh_ca_allowed_users="ubuntu"
export TF_VAR_ssh_otp_allowed_users="ubuntu"
