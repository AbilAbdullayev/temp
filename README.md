# Terraform AWS REACT Webapp template

Name: aws-terraform-react-webapp-template

## Github

Variables and Secrets

```
AWS_PROJECT_STATEFILE_BUCKET='aws-react-webapp-tf-state-u3pyz2b4'
AWS_ACCOUNT_INFRA='412381733167'
AWS_PRINCIPAL_ROLE_INFRA='arn:aws:iam::412381733167:role/terraformAccessRole'
AUDIENCE='sts.amazonaws.com'
AWS_REGION='eu-central-1'
AWS_REGION_INFRA='us-east-1'
```

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
