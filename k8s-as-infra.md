# Kubernetes as infra for startup

**Chen Xi**

**hixichen@github**

## Why k8s?

* [Kubernetes](https://kubernetes.io/) - an open-source container-orchestration system.


**You just want to have less Ops work for your company and save money!**

- Kubernetes itself is a complex beast:

	If you have just few people and do not see growth requirement from infra,k8s is not for you, maybe directly use ec2, farget, ecs. 
  
  What if traffic grows? more engineer join? more test, dev environment requirement?  You need few k8s devops guys to simply the whole process. 
  
- Running on Cloud makes things way simple.
  Network/DNS, Storage/CSI,Security.  --- requires k8s experts with deep knowledge.
  

**Less ops**

- All in YAML

- Few Seconds deployment

- Ecosystem: 
    [CNCF](https://landscape.cncf.io/) has so many open source projects to use.
    
- Great features for free: Service Discovery, Rolling update/back, Resource Limit, Auth/Security.

**Save Money**

- Sandbox: `minikube`, `kind` 	- local clusters for test.
- Namespace:	 	shares low level resources with `multi-tenant`.
  Can be super helpful for testing, for example: one 5 nodes cluster can have 10 namespaces that each one can be used as test environtment.
  
- Auto Scale: Horizontal Pod, Vertical Scale, Cluster Scale.


## K8S on Cloud:

EKS:

* [Great]: 
       - EC2 auto scaling group is super useful for node level scale.
       - Strict IAM policy
       - aws is aws, stable!
* [Bad]:
       - Do not have multiple cluster ingress now.
       - Not easy to setup.

GKE:

* [Great]: 
       - multiple cluster ingress: can be useful in case of you need really high SLA.
       - better integration with stackdriver.
       - anthos for hybrid cloud!
       - More ops tools specific targets to GKE.
       - auto upgrade for Control panel.
       - auto-recovery for Node.
* [Bad]:
       - Stackdriver is expensive. log volumes can cost as much as instances.
       - low SLA: 99.5%

References:
[eks-vs-gke-vs-aks](https://www.stackrox.com/post/2020/10/eks-vs-gke-vs-aks/)
[strengths-and-weaknesses-of-aks-eks-and-gke](https://www.fairwinds.com/blog/strengths-and-weaknesses-of-aks-eks-and-gke)


## K8S Stack:
### Ops Tools
* [Terraform](https://github.com/hashicorp/terraform): infra as code. 
  - Always versioning the statefile.
  - Be nightmare if managing too many resources within one project.
* [kustomize](https://kustomize.io/): dynamiac management.
* [kubens](https://github.com/ahmetb/kubectx): cluster&namespace switch.
* [stern](https://github.com/wercker/stern): Multi pod and container log tailing for Kubernetes
* [Helm](https://github.com/helm/helm): Helm is a tool for managing Charts. Charts are packages of pre-configured Kubernetes resources.
* [kind](https://github.com/kubernetes-sigs/kind) - Kubernetes IN Docker - local clusters for testing Kubernetes
* [Minikube](https://github.com/kubernetes/minikube) - Run Kubernetes locally

### Monitoring, Alerts, and Visualization
* [KubernetesDashboard](https://github.com/kubernetes/dashboard)- Kubernetes Dashboard is a general purpose, web-based UI for Kubernetes clusters.
* [kube-state-metrics](): a simple service that listens to the Kubernetes API server and generates metrics about the state of the objects.
* [cAdvisor](https://github.com/google/cadvisor): is an open source agent that monitors resource usage and analyzes the performance of containers.

* [kube-slack](https://github.com/wongnai/kube-slack): Kubernetes Slack Monitoring.


###Logging,Metrics,Tracing
* [fluent-bit](https://github.com/fluent/fluent-bit): Fast and Lightweight Log processor and forwarder for Linux, BSD and OSX
* [Prometheus](https://github.com/prometheus/prometheus) - The Prometheus monitoring system and time series database.
* [Grafana](https://github.com/grafana/grafana) - The tool for beautiful monitoring and metric analytics & dashboards for Graphite, InfluxDB & Prometheus & More
* [OpenTelemetry](https://opentelemetry.io/docs/): OpenTelemetry is a set of APIs, SDKs, tooling and integrations that are designed for the creation and management of telemetry data such as traces, metrics, and logs.
* [telegraf](https://github.com/influxdata/telegraf): The plugin-driven server agent for collecting & reporting metrics.

### Security
* [Cert-manager](https://github.com/jetstack/cert-manager):  Automatically provision and manage TLS certificates
* [Hashicorp-vault](https://github.com/hashicorp/vault):A tool for secrets management, encryption as a service, and privileged access management.
* [Gatekeeper](https://github.com/open-policy-agent/gatekeeper): Policy controller for Kubernetes.

 