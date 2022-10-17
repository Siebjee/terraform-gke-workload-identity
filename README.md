This module is complimentary on module [terraform-gke](https://github.com/Siebjee/terraform-gke-workload-identity).

This module is creating the following components:
* GCP Service account
* GCP Role
* GCP IAM Role Binding to the identity pool

Example usage:
```terraform
module "workload_identity_flux" {
  source = "git::https://github.com/Siebjee/terraform-gke-workload-identity?ref=0.1.0"

  project_id                 = "my-project"
  namespace                  = "flux-system"
  kubernetes_service_account = "image-reflector-controller"

  account = {
    id           = "flux-system"
    display_name = "GKE Flux Service Account"
  }

  role = {
    id          = "flux"
    title       = "Flux role"
    description = "Flux service account"
    permissions = [
      "artifactregistry.repositories.downloadArtifacts",
      "artifactregistry.repositories.get",
      "artifactregistry.repositories.list",
      "storage.objects.get",
      "storage.objects.list",
      "storage.objects.create",
      "storage.objects.delete",
    ]
  }
}
```
