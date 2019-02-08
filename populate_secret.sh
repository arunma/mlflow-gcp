#!/usr/bin/env bash

sed "s/GCLOUD_SERVICE_KEY_ENC_REPLACE/`echo $GCLOUD_SERVICE_KEY_ENC|base64`/g" mlflow-gcp-secret.yaml.template | \
sed "s/GCP_STORAGE_BUCKET_REPLACE/`echo $GCP_STORAGE_BUCKET|base64`/g" | \
kubectl apply -f -