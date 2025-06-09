# Module Usage

## Example
```hcl
module "externalsecret" {
  source                   = "github.com/anoopdevopseng/terraform-helm-external-secrets"
  project_id               = "GOOGLE-PROJECT-ID"
  location                 = "europe-west3"
  cluster_name             = "MY-GKE"
}
```