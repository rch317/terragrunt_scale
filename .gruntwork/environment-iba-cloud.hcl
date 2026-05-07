// Pipelines environment config for the iba-cloud AWS account.
// Pipelines reads all .hcl files in .gruntwork/. Add a new file here to register a new environment.
// Docs: https://docs.gruntwork.io/2.0/docs/pipelines/configuration/settings

environment "iba-cloud" {
  // Defines the environment as matching all units under iba-cloud/.
  filter {
    paths = ["iba-cloud/*"]
  }

  authentication {
    // Pipelines assumes these IAM roles via OIDC. No static credentials needed.
    // plan role: read-only, used on PRs. apply role: write, used on merge to deploy branch.
    // Both roles are created by the bootstrap stack in _global/bootstrap/.
    aws_oidc {
      account_id         = "522921482914"
      plan_iam_role_arn  = "arn:aws:iam::522921482914:role/pipelines-plan"
      apply_iam_role_arn = "arn:aws:iam::522921482914:role/pipelines-apply"
    }
  }
}
