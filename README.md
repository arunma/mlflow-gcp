# mlflow-gcp 

(Inspired by https://github.com/KielRodriguez/mlflow-aws)

**Create a service account**

Create a service account and grant write access to Storage buckets. 
Download the API key (JSON) 


**Run using Docker**

```bash
export GCLOUD_SERVICE_KEY_ENC=$(cat <PATH_TO_SECRET_JSON> | base64)
export GCP_STORAGE_BUCKET=<GS_BUCKET_NAME>

docker run --name mlflow -P \
-e GCLOUD_SERVICE_KEY_ENC=$GCLOUD_SERVICE_KEY_ENC \
-e GCP_STORAGE_BUCKET=$GCP_STORAGE_BUCKET \
mlflow-gcp:latest

```

*Optional*

```bash 
export EXPERIMENT_NAME=<NAME_OF_THE_EXPERIMENT>

docker run --name mlflow -P \
-e GCLOUD_SERVICE_KEY_ENC=$GCLOUD_SERVICE_KEY_ENC \
-e GCP_STORAGE_BUCKET=$GCP_STORAGE_BUCKET \
-e EXPERIMENT_NAME=$EXPERIMENT_NAME \
mlflow-gcp:latest

```

**Run using kubectl**


```bash
export GCLOUD_SERVICE_KEY_ENC=$(cat <PATH_TO_SECRET_JSON> | base64)
export GCP_STORAGE_BUCKET=<GS_BUCKET_NAME>

Optional : export EXPERIMENT_NAME=<NAME_OF_THE_EXPERIMENT>

kubectl create -f mlflow-gcp-pod.yaml

```



