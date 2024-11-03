# Terraform AWS REACT Webapp template

Name: aws-terraform-react-webapp-template

## Github

Variables and Secrets

``` AWS_PROJECT_STATEFILE_BUCKET='aws-react-webapp-tf-state-u3pyz2b4' ```

## Terraform

### Init

```
terraform init \
  -backend-config="bucket=aws-react-webapp-tf-state-u3pyz2b4" \
  -backend-config="region=us-east-1" \
  -backend-config="key=terraform.tfstate"
```

```
terraform workspace new develop
terraform workspace select develop
```

### Plan

``` terraform plan ```

### Apply

``` tf apply -auto-approve ```
