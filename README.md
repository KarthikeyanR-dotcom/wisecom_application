# Wisecow Application Deployment Documentation

## Prerequisites
Before starting, ensure that the following are in place:

1. **Git**: Ensure Git is installed on your machine to manage version control for the source code.
2. **Docker**: Ensure Docker is installed and running to build and manage container images.
3. **Kubernetes**: Access to a running Kubernetes cluster where the application will be deployed.
4. **kubectl**: Ensure `kubectl` is installed and configured to interact with your Kubernetes cluster.
5. **Docker Hub Credentials**: Your Docker Hub UserID and Password must be provided for successful image pushes.
6. **Cert-Manager**: For TLS certificates, ensure Cert-Manager is installed.

## Project Overview
This documentation outlines the development and deployment process for the Wisecow application, including the creation of a Docker image, Kubernetes deployment, CI/CD setup, and TLS implementation.

### 1. Dockerfile Development
- **Objective**: Create a Dockerfile for the Wisecow application.
- **Status**: Dockerfile created successfully and located in the root directory.

### 2. Kubernetes Deployment
- **Objective**: Create Kubernetes manifest files for deploying the application.
- **Status**: Kubernetes manifest files have been created and are located in the `/Kubernetes_file` directory.

### 3. Continuous Integration and Deployment (CI/CD)
- **Objective**: Automate the build and push of the Docker image and the deployment of the updated application to the Kubernetes environment.
- **Status**: GitHub Actions workflow created and located in `.github/workflows`.

### 4. TLS Implementation
- **Objective**: Secure the application using TLS certificates.
- **Prerequisite**: Run the following command to install Cert-Manager:
  ```bash
  kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.4.0/cert-manager.yaml
  //curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  //curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  //sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

  //kubectl apply -f K8_manifest.yaml
//namespace/ms unchanged
//deployment.apps/wisecow-deployment unchanged
//service/wisecow-service unchanged
//ingress.networking.k8s.io/wisecow-ingress unchanged
//Error from server (InternalError): error when creating "K8_manifest.yaml": Internal error occurred: failed calling webhook "webhook.cert-manager.io": failed to call webhook: 
//Post "https://cert-manager-webhook.cert-manager.svc:443/mutate?////timeout=10s": dial tcp 10.108.13.120:443: connect: connection refused

