provider "tfe" {
  hostname = var.hostname
  token    = var.token
}

resource "tfe_organization" "demoOrg" {
  name  = "jl-demo-four-points"
  email = "jlinn@hashicorp.com"
}

resource "tfe_workspace" "demoWorkspace" {
  name         = "demo-workspace-app1"
  organization = tfe_organization.demoOrg.id 
}

resource "tfe_team" "demoTeam" {
  name         = "demo-team-app1"
  organization = tfe_organization.demoOrg.id 
}

resource "tfe_organization_membership" "test" {
  organization = tfe_organization.demoOrg.id 
  email = "jelinn@gmail.com"
}

resource "tfe_team_organization_member" "test" {
  team_id = tfe_team.demoTeam.id
  organization_membership_id = tfe_organization_membership.test.id
}
