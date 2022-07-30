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
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2FBebopTechnology%2FOnboarding&cloudshell_git_branch=main)
