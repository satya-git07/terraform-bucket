# Provider Configuration
provider "google" {
  project     = "satyanarayana"  # Replace with your GCP project ID
  region      = "us-central1"  # Replace with your desired region

}

# Create GCP Bucket
resource "google_storage_bucket" "tf_state_bucket" {
  name          = "return-of-the-dragon"  # Replace with a unique bucket name
  location      = "US"  # Replace with your desired bucket location
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

# Backend Configuration for Terraform State
terraform {
  backend "gcs" {
    bucket = "my-tf-state-bucket"  # Match the bucket name created above
    prefix = "terraform/state"     # Path where the state file will be stored
  }
}
