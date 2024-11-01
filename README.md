# Terraform template for AWS

Name: aws-terraform-template

## Terraform

### Init

``` export TF_VAR_region=us-east-1 ``` 
or
``` tf init --backend-config region=us-east-1 ```

### Plan

```
export AWS_PROFILE="sso-profile"
terraform plan
```

### Apply

``` tf apply -auto-approve ```

### Update stages cashe

``` tf show | tee Artifacts/stage1.tfstate ```