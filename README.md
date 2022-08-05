## BeBop CSP Onboarding

#### AWS
Deploy the necessary IAM Roles and Polcies by clicking the Lauch Stack button below. Please review the CloudFormation Template here before deploying as it creates IAM resources

[![Launch Stack](https://cdn.rawgit.com/buildkite/cloudformation-launch-stack-button-svg/master/launch-stack.svg)](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=Bebop&templateURL=https://bebop-oneclick-onboarding.s3.us-west-1.amazonaws.com/cloudformation.yaml)

The stack supports two configurations
- Bebop Managed IAM: Select `Full` for Permissions
	- Bebop Role is given Administrator Access of the cloud account, and IAM is managed by Bebop
- Self Managed IAM: Select `Minimal` for Permissions
	- Bebop is given Minimum required permissions and IAM is self-managed by the Customer

#### GCP
Deploy the necessarry IAM roles in Google Cloud Project for Bebop. 
 - Login to Google Cloud Console with user having IAM access to the desired project for Bebop.
 - Click on the below `Open in Cloud Shell` and trust the repo, it will auto clone the repo.

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2FBebopTechnology%2Fcsp-account-onboard&cloudshell_git_branch=main&cloudshell_workspace=gcp)

Run the below commands to deploy the necessary IAM resources.
```
terraform init
terraform plan -out plan.out
```
Enter the values for requested variables. `project`, `region`, and `iam_access_level`. `iam_access_level` should be one of the `full` or `minimal`
- `minimal` deploys minimal permissions required for Bebop and IAM is self-managed by the customer.
- `full` grants owner permissions to Bebop and IAM is managed by Bebop.

Apply the plan from above
```terraform apply plan.out```