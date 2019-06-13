#!/usr/bin/env bash

S3_BUCKET=api-app-install
INPUT_FILE=template.yml
OUTPUT_FILE=template-output.yml
STAGE_NAME=dev
STACK_NAME=aws-sam-ref-app-$STAGE_NAME

# Copy Swagger file to S3 to be able to transform its content for "deploying" it to API Gateway
aws s3 cp swagger.yml s3://$S3_BUCKET/swagger.yml

yarn install
yarn test
# npm prune --production // yarn auto prunes implicitly

sam.cmd package --template-file $INPUT_FILE --output-template-file $OUTPUT_FILE --s3-bucket $S3_BUCKET

sam.cmd deploy --template-file $OUTPUT_FILE --stack-name $STACK_NAME --parameter-overrides StageName=$STAGE_NAME S3BucketName=$S3_BUCKET --capabilities CAPABILITY_NAMED_IAM

export API_GATEWAY_URL=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[0].OutputValue' --output text)

echo "API Gateway URL: $API_GATEWAY_URL"
read