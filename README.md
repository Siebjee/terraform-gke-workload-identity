Usage:
```terraform
module "workload_identity_flux" {
  source = "../../../modules/gke-workload-identity"

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
