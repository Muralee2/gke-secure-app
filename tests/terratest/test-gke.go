package test

import (
  "testing"
  "strings"

  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestGKECluster(t *testing.T) {
  t.Parallel()

  terraformOptions := &terraform.Options{
    // Adjust to your Terraform code directory
    TerraformDir: "../../terraform",

    Vars: map[string]interface{}{
      "project_id":    "your-gcp-project-id",
      "region":        "asia-south1",
      "zone":          "asia-south1-a",
      "network_name":  "custom-vpc",
    },
  }

  // Clean up resources at the end
  defer terraform.Destroy(t, terraformOptions)

  // Init and apply the Terraform code
  terraform.InitAndApply(t, terraformOptions)

  // Test output
  gkeEndpoint := terraform.Output(t, terraformOptions, "gke_endpoint")

  // Basic validation
  assert.Contains(t, gkeEndpoint, ".", "GKE endpoint should look like a valid URL")
}
