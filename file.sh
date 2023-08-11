#!/bin/bash

 

TO_EMAIL="jaskiratbrar33@gmail.com"

 

SUBJECT="Pending Pods Found!"

 

PENDING_PODS=$(kubectl get pods --field-selector=status.phase=Pending -o json | jq -r '.items[].metadata.name')
TIMESTAMP=$(date +"%Y-%m-%d %H-%M-%S")

 

if [ -n "$PENDING_PODS" ] && [ -n "$TIMESTAMP" ]; then
    echo "$PENDING_PODS - $TIMESTAMP" | ssmtp jaskiratbrar33@gmail.com
    echo "Email Sent!"
else
    echo "No pending pods found or timestamp is empty."
fi
