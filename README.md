# Terraform template for AWS REACT Webapp

Name: aws-terraform-react-webapp-template

## AWS credentials

Set region for Application

``` export AWS_REGION=eu-central-1 ```

Set profile

``` export AWS_PROFILE="react-develop" ```

Profile example:

```
[profile react-develop]
sso_session = aiclouds
sso_account_id = {{ AccountId }}
sso_role_name = AdministratorAccess
region = eu-central-1
```

## Terraform

### Init

``` tf init ```

### Plan

``` terraform plan ```

### Apply

``` tf apply -auto-approve ```
