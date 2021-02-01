
## install tekton pipeline
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

## install tekton trigger
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml


kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.5.3/tekton-dashboard-release.yaml

aws ecr describe-images \
    --repository-name cluster-autoscaler \
    --image-ids imageTag=v1.13.6