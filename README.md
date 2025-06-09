# terraform-helm-external-secret For GCP (Google Cloud Project)
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.0.0-pre2 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >=1.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 3.0.0-pre2 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >=1.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.token_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.workload_identity_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/3.0.0-pre2/docs/resources/release) | resource |
| [kubectl_manifest.gcp_cluster_secret_store](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | GKE Cluster Name | `string` | n/a | yes |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | Version of the External Secrets Helm chart | `string` | `"latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID | `string` | n/a | yes |
| <a name="input_versions"></a> [versions](#input\_versions) | n/a | `string` | `"v0.17.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_externalsecret_release_status"></a> [externalsecret\_release\_status](#output\_externalsecret\_release\_status) | n/a |
