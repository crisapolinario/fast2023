variable "google_region" {
  description = "Google Region"
  type        = string
  default     = "us-central1"
}

variable "google_zone" {
  description = "Google Zone"
  type        = string
  default     = "us-central1-a"
}

variable "google_project_number" {
  description = "Google Project Number"
  type        = string
}

variable "google_instance_type" {
  description = "Google Instance Type"
  type        = string
  default     = "e2-standard-2"
  # default     = "e2-small"
}

variable "google_instance_image" {
  description = "Google Instance Image"
  type        = string
  default     = "centos-cloud/centos-stream-8"
}

# variable "google_network" {
#   description = "Google Network Name"
#   type        = string
#   default     = "default"
# }

variable "ssh_key_path_default_user" {
  description = "Path SSH Key for Default User"
  type        = string
  default     = "~/.ssh/ecdsa_ansible.pub"
}

variable "default_user" {
  description = "Default User SSH"
  type        = string
  default     = "ansible"
}