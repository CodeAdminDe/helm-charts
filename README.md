## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add codeadminde https://codeadminde.github.io/helm-charts/

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo
codeadminde` to see the charts.

To install the <chart-name> chart:

    helm install my-release-name codeadminde/<chart-name>

To uninstall the chart:

    helm uninstall my-release-name

### Collection

> Please note that this is a private Helm chart repository and neither my work nor I am directly or indirectly affiliated with the packaged applications or their authors, unless otherwise stated.

The following charts are currently available:

| Name | Version | AppVersion | Description |
|------|---------|------------|-------------|
| bind9-hidden-primary | 0.4.3 | 9.20 | A Helm chart for bind9 to use as hidden primary, based on the offical Docker Image by InternetSystemsConsortium (ISC) |
| coturn-server | 0.2.10 | 4.8.0 | A Helm chart for an easier coturn deployment at kubernetes. |
| libchart-cnps | 0.2.1 | 0.2.0 | A (experimental) Helm chart of cilium network policies for usage as a library chart. |
| netbird-agent | 0.10.2 | 0.65.2 | A Helm chart for an easier NetBird agent (https://netbird.io) deployment at kubernetes. |
| netbird-management | 1.13.0 | 0.65.0 | A Helm chart for an easier NetBird management stack (https://netbird.io) deployment at kubernetes. |
| ollama | 0.17.5 | 0.15.6 | A Helm chart for an easier ollama (https://ollama.com) deployment on k8s. Please note that this is a private helm chart and not directly or indirectly affiliated with ollama or its authors. |
| outline | 1.8.0 | 1.3.0 | A Helm chart for an easier outline (https://getoutline.com) deployment at kubernetes. |
| redis | 0.4.0 | 8.6.0 | A Helm chart for Redis k8s deployment, based on library/redis |
| supabase | 0.4.3 | 0.4.3 | A proxy chart for an easier supabase deployment at kubernetes. Take a look at the dependency chart values.yaml and update at least security related values!! |
| webfinger | 0.4.0 | 0.9.1 | A Helm chart for an easy webfinger deployment at kubernetes. |

