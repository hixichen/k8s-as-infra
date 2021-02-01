# Usage of kustomize

**Purpose:** This respository has the sample usage of kustomize

**Author:** xichen0425@gmail.com

**Date:** 03/14/2020

# Prerequisites


## Tools install

- kustomize

	```sh
	brew update && brew install kustomize
	```

## Sample Usage

	```sh
	cd hashicorp-vault
	mkdir generated
	kustomize build -o generated && kubectl apply -f generated --dry-run
	```

Note:

- Check the generated with generated yamls. 
- Just a sample work with `--dry-run`, lacks of image and iam for real apply.

## Learn how to use kustomize
https://github.com/kubernetes-sigs/kustomize

https://kustomize.io/

https://kubectl.docs.kubernetes.io/pages/app_management/introduction.html
