## Helm Chart for {brandname}

A Helm chart for building and deploying a [{brandname}]({website}) application.

## Image Configuration

The configuration for the images that are used by the cluster is configured in a `images` section.

| Value | Description | Default | Additional Information |
| ----- | ----------- | ------- | ---------------------- |
| `images.server` | FQN of the {brandname} server you want to deploy | `{serverImage}` | - |
| `images.initContainer` | FQN of a minimal linux container used by the initContainer | `registry.access.redhat.com/ubi8-micro` | - |

## Cluster Configuration

The configuration of the {brandname} cluster to be deployed is defined in the `deploy` section.

| Value | Description | Default | Additional Information |
| ----- | ----------- | ------- | ---------------------- |
| `deploy.replicas` | The number of {brandname} pods in the cluster. | 1 | - |
| `deploy.container.extraJvmOpts` | JVM options passed to the {brandname} server. | `""` | - |
| `deploy.container.storage.ephemeral` | Whether storage is ephemeral or permanent. | false | When set to true all persisted data is deleted when clusters shut down or restart. |
| `deploy.container.storage.size` | The amount of storage for {brandname} pods. | 1Gi | - |
| `deploy.container.storage.storageClassName` | The name of a StorageClass object to use for the persistent volume claim (PVC). | `""` | If you include this field, you must specify an existing storage class as the value. If you do not include this field, the persistent volume claim uses the storage class that has the storageclass.kubernetes.io/is-default-class annotation set to true. |
| `deploy.container.resources.limits.cpu` | {brandname} pod's CPU limit (measured in CPU units). | 500m | - |
| `deploy.container.resources.limits.memory` | {brandname} pod's memory limit (measured in bytes). | 512Mi | - |
| `deploy.container.resources.requests.cpu` | {brandname} pod's CPU requests (measured in CPU units). | 500m | - |
| `deploy.container.resources.requests.memory` | {brandname} pod's memory requests (measured in bytes). | 512Mi | - |
| `deploy.security.authentication` | If false authentication is disabled for {brandname}'s single-port endpoint. | true | - |
| `deploy.security.secretName` | Specifies a secret that contains all required security data. | `""` | If configured, then `deploy.security.batch` is ignored. |
| `deploy.security.batch` | A {brandname} CLI batch file that can be used to create users, roles etc before server startup. | `""` | - |
| `deploy.expose.type` | How to expose the {brandname} single-port externally. Set to empty if external access is not desired. | Route | Valid options `["", "Route"]` |
| `deploy.expose.nodePort` | A node port to which the load balancer forwards traffic. | 0 | - |
| `deploy.expose.host` | Hostname to be exposed. | `""` | Optional |
| `deploy.expose.annotations` | Annotations added to the created network resource, e.g. a Route. | `{}` | - |
| `deploy.logging.catagories` | Log levels for provided categories. | `{}` | - |
| `deploy.resourceLabels` | Labels that are added to the created {brandname} resources, e.g. Pods and Services. | `{}` | - |
| `deploy.affinity` | Pod affinity settings | `{}` | An empty value results in a default anti-affinity scheme that prefers pods to be distributed across unique nodes. |
| `deploy.makeDataDirWritable` | If true, a initContainer is created in order to execute `chmod -R` on the `/opt/infinispan/server/data` dir. | false | - |
| `deploy.nameOverride` | The name to use for all cluster resources. | Helm Chart release name | This should only be configured if the created resources require a name different to the Helm Chart release name. |
