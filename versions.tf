terraform {
  required_version = ">=1.2.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.11"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.11"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-project-factory/v13.0.0"
  }
  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-project-factory/v13.0.0"
  }
}
