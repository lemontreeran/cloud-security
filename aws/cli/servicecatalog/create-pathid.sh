#!/usr/bin/env bash
PRODUCT_ID=$1
PORTFOLIO_ID=$2 
PRINCIPAL_ARN=$3 
# Possible values: IAM
PRINCIPAL_TYPE=${4:-"IAM"} 
# echo $PRINCIPAL_TYPE

CREATE_PATHID_COMMAND="aws servicecatalog associate-principal-with-portfolio \
    --portfolio-id $PORTFOLIO_ID \
    --principal-arn $PRINCIPAL_ARN \
    --principal-type $PRINCIPAL_TYPE"

eval ${CREATE_PATHID_COMMAND} 

if [ "$?" != 0 ]; then
    echo "Creating PathID failed!"
    exit 1
fi

LIST_PATH_COMMAND="aws servicecatalog list-launch-paths \
    --product-id $PRODUCT_ID"

echo "Listing the Path information for your Portfolio!"
eval ${LIST_PATH_COMMAND} 

