# tags = aws_servicecatalogappregistry_application.webapp.application_tag

resource "aws_servicecatalogappregistry_application" "project" {
  name        = var.project_name
  description = var.project_description
}