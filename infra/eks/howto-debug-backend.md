###Debug backend on K8S


####1.Prepare image
 - Modify your code locally and run with client integration test
 - Commit your changes to get a new commit hash
 - Get image tag: export IMAGE_TAG=$(git rev-parse HEAD)
 - Build new image: docker build -t aws-test-account.dkr.ecr.us-west-2.amazonaws.com/sample-backend:$IMAGE_TAG .
 - Login docker: aws ecr get-login --no-include-email --region us-west-2
 - Push docker image: docker push aws-test-account.dkr.ecr.us-west-2.amazonaws.com/sample-backend:$IMAGE_TAG
  
####2.Modify deploy yaml with image

```
check file: ~/sample-backend/config/ENV/kustomization.yaml
Update newTag with IMAGE_TAG
```

```    
images:
- name: sample-backend
  newName: aws-test-account.dkr.ecr.us-west-2.amazonaws.com/sample-backend
  newTag: stable
```
####3.Deploy from your Laptop (breakglass change, DONOT do it for production.)

 - For Dev:
    kubectl replace --force -k config/dev
 	
 - For other env:
    kubectl apply -k config/ENV

####4.To get public load balanced address to backend

kubectl get svc -n ENV (currently only stable)

```
NAME                     TYPE           CLUSTER-IP     EXTERNAL-IP                                                                     PORT(S)          AGE
sample-backend-stable       ClusterIP      None           <none>                                                                          9090/TCP         30d
sample-backend-stable-elb   LoadBalancer   10.100.32.48   aa67142fac667444db7263888254e020-3357f609514a4d98.elb.us-west-2.amazonaws.com   9090:30474/TCP   28d
```
