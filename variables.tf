variable "project_id" {
  description = "The Google Cloud Platform Project ID"
  type        = string
}

variable "account" {
  description = "The service account to create"
  type = object(
    {
      id : string
      display_name : string
    }
  )
}

variable "role" {
  description = "The role to create"
  type = object(
    {
      id : string
      title : string
      description : string
      permissions : list(string)
    }
  )
}

variable "namespace" {
  description = "The namespace to bind the SVC to"
  type        = string
}

variable "kubernetes_service_account" {
  description = "The kubernetes service account to bind the SVC to"
  type        = string
}
