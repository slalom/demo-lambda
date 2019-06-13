# Reference AWS Lambda using Serverless Application Model (SAM)

This repo can be used as a template for creating AWS Lambda functions using the
AWS Serverless Application Model. These functions will be deployed by AWS CloudFormation
to AWS Lambda and Amazon API Gateway.

## What's Here

* README.md - this file
* swagger.yml - this file defines the swagger API and used to generate API gateway
* template.yml - this file contains the AWS Serverless Application Model (AWS SAM) used
  by AWS CloudFormation to deploy your service to AWS Lambda and Amazon API
  Gateway.
* buildspec.yml - this file is used by AWS CodeBuild to package your service for deployment to AWS Lambda
* scripts/deploy.sh - script to deploy application to AWS
* inventory/index.js - this file contains the AWS Lambda handler code
* inventory/add.js - this file contains the sample Node.js code for the web service
* inventory/add.test.js - this file contains the add tests
* inventory/search.js - this file contains the sample Node.js code for the web service
* inventory/search.test.js - this file contains the search tests
* package.json - nodejs project configuration

## What Do I Do Next?

### install docker

https://docs.docker.com/install/ 

### install aws cli

https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

### Install sam cli

```bash
brew tap aws/tap
brew install aws-sam-cli
```
This is necessary for running below

### Run locally

```bash
sam local start-api
```

Run API locally and provides test end-points

Learn more about AWS Serverless Application Model (AWS SAM) and how it works here:
https://github.com/awslabs/serverless-application-model/blob/master/HOWTO.md

### Run tests

```bash
yarn run test
```

AWS CodeBuild also runs through your `buildspec.yml` file. AWS CodeBuild will run the tests during the
build stage of your project pipeline. You can find the test results in the AWS CodeBuild console.

Learn more about AWS CodeBuild and how it builds and tests your application here:
https://docs.aws.amazon.com/codebuild/latest/userguide/concepts.html

### Manually Deploy

```bash
./scripts/deploy.sh
```

This will test and build the application. It packages it for deployment and uses the `sam` cli to deploy to AWS. See configuration in [scripts/deploy.sh](scripts/deploy.sh)

## More Info

* AWS Lambda Developer Guide: http://docs.aws.amazon.com/lambda/latest/dg/deploying-lambda-apps.html

* Best Practices: https://docs.aws.amazon.com/codestar/latest/userguide/best-practices.html?icmpid=docs_acs_rm_sec
