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
    // Path to where your Terraform code is located
    TerraformDir: "../../terraform",

    // Variables to pass to Terraform
    Vars: map[string]interface{}{
      "project_id":            "your-gcp-project-id",
      "region":                "asia-south1",
      "zone":                  "asia-south1-a",
      "network_name":          "custom-vpc",
      "domain_name":           "your.domain.com",
      "cloudflare_zone_id":    "your-zone-id",
      "cloudflare_api_token":  "your-token",
    },
  }

  // Defer destroy
  defer terraform.Destroy(t, terraformOptions)

  // Init and apply
  terraform.InitAndApply(t, terraformOptions)

  // Get output
  gkeEndpoint := terraform.Output(t, terraformOptions, "gke_endpoint")

  assert.True(t, strings.Contains(gkeEndpoint, "."), "GKE endpoint should contain a dot")
}
