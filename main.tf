resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "external-secrets"
  create_namespace = true
  version          = var.versions

  set = [
    {
      name  = "installCRDs"
      value = "true"
    },
    {
      name  = "serviceAccount.create"
      value = "true"
    },
    {
      name  = "serviceAccount.name"
      value = "external-secrets-sa"
    }
  ]
}

resource "kubectl_manifest" "gcp_cluster_secret_store" {
  depends_on = [resource.helm_release.external_secrets]
  yaml_body  = <<YAML
apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: gcp-store
  namespace: external-secrets
spec:
  provider:
    gcpsm:
      projectID: ${var.project_id}
      auth:
        workloadIdentity:
          clusterLocation: ${var.location}
          clusterName: ${var.cluster_name}
          clusterProjectID: ${var.project_id}
          serviceAccountRef:
            name: external-secrets-sa
            namespace: external-secrets
YAML
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_project_iam_member" "workload_identity_binding" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/external-secrets/sa/external-secrets-sa"
}

resource "google_project_iam_member" "token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/external-secrets/sa/external-secrets-sa"
}