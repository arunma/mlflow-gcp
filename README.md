# mlflow-gcp 

(Inspired by https://github.com/KielRodriguez/mlflow-aws)

**Create a service account**

Create a service account and grant write access to Storage buckets. 
Download the API key (JSON) 


**Run using Docker**

```bash
export GCLOUD_SERVICE_KEY_ENC=$(cat <PATH_TO_SECRET_JSON> | base64)
export GCP_STORAGE_BUCKET=<GS_BUCKET_NAME> # exclude gs:// prefix

docker pull arunma/mlflow-gcp
docker run --name mlflow -P \
-e GCLOUD_SERVICE_KEY_ENC=$GCLOUD_SERVICE_KEY_ENC \
-e GCP_STORAGE_BUCKET=$GCP_STORAGE_BUCKET \
-p 5000:5000 \
arunma/mlflow-gcp:latest

```

*Optional*

```bash 
export EXPERIMENT_NAME=<NAME_OF_THE_EXPERIMENT>

docker run --name mlflow -it -P \
-e GCLOUD_SERVICE_KEY_ENC=$GCLOUD_SERVICE_KEY_ENC \
-e GCP_STORAGE_BUCKET=$GCP_STORAGE_BUCKET \
-e EXPERIMENT_NAME=$EXPERIMENT_NAME \
-p 5000:5000 \
arunma/mlflow-gcp:latest

```

**Run using kubectl**

Provision kubernetes cluster

```shell
# create cluster
gcloud container clusters create my-cluster --region asia-southeast1

# run this if you need to configure your shell to talk to this cluster (e.g. if you restarted your computer)
gcloud container clusters get-credentials my-cluster 
```

```bash
export GCLOUD_SERVICE_KEY_ENC=$(cat <PATH_TO_SECRET_JSON> | base64)
export GCP_STORAGE_BUCKET=<GS_BUCKET_NAME> # exclude gs:// prefix

Optional : export EXPERIMENT_NAME=<NAME_OF_THE_EXPERIMENT>

```

**Create secret in Kubernetes from local environment variable**

This script just replaces the `GCLOUD_SERVICE_KEY_ENC` and `GCP_STORAGE_BUCKET` variables in `mlflow-gcp-secret.yaml.template` file with the values from the local environment variable. 

Also creates the `Secret` in Kubernetes

```
source ./populate_secret.sh
```


**Create Deployment and service**
```
kubectl create -f mlflow-gcp-deployment.yaml

kubectl create -f mlflow-gcp-service.yaml
```

To get the public IP of your kubernetes cluster, run `kubectl get service` after 2 minutes or so





