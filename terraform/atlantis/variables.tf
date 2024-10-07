variable "github_user" {
  description = "GitHub username for Atlantis to authenticate with."
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token for Atlantis."
  type        = string
  sensitive   = true
}

variable "github_webhook_secret" {
  description = "Secret for GitHub webhook authentication."
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Kubernetes namespace where Atlantis will be deployed."
  type        = string
  default     = "atlantis"
}
