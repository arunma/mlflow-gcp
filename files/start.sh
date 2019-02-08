#!/bin/sh

set -ex

if ! ([ -z "${GCLOUD_SERVICE_KEY_ENC}" ] || [ -z "${GCP_STORAGE_BUCKET}" ]); then
  echo  "Creating experiment"
  NAME="Experiment1"
  echo $GCLOUD_SERVICE_KEY_ENC | base64 --decode > ~/secrets_dec.json
  export GOOGLE_CLOUD_KEYFILE_JSON=~/secrets_dec.json
  if ! [ -z "${EXPERIMENT_NAME}" ]; then
    NAME=$EXPERIMENT_NAME
    cd /mlflow
    mlflow experiments create --artifact-location gs://$GCP_STORAGE_BUCKET $NAME
  fi
else
  echo "Not found environment variables"
fi

mlflow server \
    --file-store /mlflow/mlruns \
    --host 0.0.0.0 \
    --default-artifact-root gs://$GCP_STORAGE_BUCKET \
    --port 5000
