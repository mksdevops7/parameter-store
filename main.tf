resource "aws_ssm_parameter" "params" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value
}
variable "parameters" {
  default = [
    {name = "prod.rds.master_password", value = "expenseprod1234", type = "SecureString"},
    {name = "prod.rds.master_username", value = "expense", type = "String"},
    {name = "prod.expense.frontend.backend_url", value = "http://backend-prod.mkdevops.online/", type = "String"},
    {name = "prod.rds.endpoint", value = "prod-mysql.cluster-cshnthuj0kj8.us-east-1.rds.amazonaws.com", type = "String"},

    ##Dev env
    {name = "dev.expense.frontend.backend_url", value = "http://backend-dev.mkdevops.online/", type = "String"}
  ]
}

## Note: Ideally we dont keep passwords in GIT REPOS, Those will be created manually. Secret management of creating secrets is most of the time is manual

