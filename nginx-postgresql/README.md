# Orchestrator Test Chart

This Helm chart deploys a two-tier application stack consisting of an Nginx web server and a PostgreSQL database. It is designed to test complex orchestrator deployments, including persistent storage and networking.

This chart assumes a prerequisite storage system like Longhorn is already installed and provides a `StorageClass` named `longhorn`.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.2.0+
- A `StorageClass` provider must be installed on the cluster. By default, this chart uses the `longhorn` StorageClass.

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `storageClassName` | The name of the StorageClass to use for the shared PVC. | `longhorn` |
| `persistence.size` | The size of the shared persistent volume. | `3Gi` |
| `nginx.replicaCount` | Number of Nginx replicas. | `1` |
| `postgresql.replicaCount` | Number of PostgreSQL replicas. | `1` |
| `ingress.enabled` | Enable or disable the Ingress resource for Nginx. | `true` |
| `networkPolicy.enabled` | Enable or disable NetworkPolicies for pod security. | `true` |



