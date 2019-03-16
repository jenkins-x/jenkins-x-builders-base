#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

updatebot push-version --kind docker \
    gcr.io/jenkinsxio/builder-base ${VERSION}
updatebot push-version --kind docker \
    jenkinsxio/jenkins-x-builders ${VERSION}
updatebot push-regex -r "builderTag: (.*)" -v ${VERSION} jx-build-templates/values.yaml
updatebot push-regex -r "\s+tag: (.*)" -v ${VERSION} --previous-line "\s+repository: jenkinsxio/builder-go" values.yaml
updatebot push-regex -r "\s+tag: (.*)" -v ${VERSION} --previous-line "\s+repository: jenkinsxio/builder-maven" prow/values.yaml
