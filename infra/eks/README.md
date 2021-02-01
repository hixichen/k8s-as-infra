# Access AWS EKS Dev Cluster

**Purpose:** This respository contains the configuration for aws eks.

**Author:** xichen0425@gmail.com

**Date:** 03/14/2020

# Prerequisites


## Tools install

- kubectl && awscli && aws-iam-authenticator

```sh

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.10/bin/darwin/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

pip install awscli --upgrade --user
brew update && brew install aws-iam-authenticator
```

## Setup AWS Account

aws console: https://xxxxx.signin.aws.amazon.com/console

After login into the account, make sure follow the [steps](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) to configure aws credential for your laptop.

Note: please set region to `us-west-2`.



## Get Permission to access AWS EKS cluster
- Make sure you have right permission to access aws eks resource on AWS IAM.
- Add your user ARN and username to cluster auth configmap.

    - Get your ARN via `aws sts get-caller-identity`
    - Update file with new user section in `aws-auth-cm.yaml`.
    - Apply the yaml via admin user.

    Check Detailed info [here](https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/)

## Access to AWS EKS Cluster

```sh
aws eks --region us-west-2 update-kubeconfig --name dev-cluster
```
Sample output:

```
~ kubectl get node
NAME                                          STATUS   ROLES    AGE    VERSION
ip-172-31-41-37.us-west-2.compute.internal    Ready    <none>   161m   v1.15.10-eks-bac369
ip-172-31-54-114.us-west-2.compute.internal   Ready    <none>   161m   v1.15.10-eks-bac369

~ kubectl get po --all-namespaces
NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   aws-node-45pck             1/1     Running   0          160m
kube-system   aws-node-46m64             1/1     Running   0          160m
kube-system   coredns-86d5cbb4bd-64wct   1/1     Running   0          172m
kube-system   coredns-86d5cbb4bd-c8wpw   1/1     Running   0          172m
kube-system   kube-proxy-76kfp           1/1     Running   0          160m
kube-system   kube-proxy-nlw4p           1/1     Running   0          160m
```

### Tips
- install kubectx

   After  `brew install kubectx` , you can set namespace via `kubens MY_NAMESPACE`
- alias for kubectl:

  `alias ku="/usr/local/bin/kubectl"`
- dry-run before apply:

  `kubectl apply -f aws-auth-cm.yaml --dry-run`
