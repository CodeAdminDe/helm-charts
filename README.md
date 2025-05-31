## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add codeadminde https://codeadminde.github.io/helm-charts/

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
codeadminde` to see the charts.

To install the <chart-name> chart:

    helm install my-release-name codeadminde/<chart-name>

To uninstall the chart:

    helm uninstall my-release-name

### Collection

The following charts are currently available:

| Name | Version | AppVersion | Description |
|------|---------|------------|-------------|
| bind9-hidden-primary | 0.4.2 | 9.20 | A Helm chart for bind9 to use as hidden primary, based on the offical Docker Image by InternetSystemsConsortium (ISC) |
| outline | 0.6.6 | 0.82.0 | A Helm chart for an easier outline (https://getoutline.com) deployment at kubernetes. |

