#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

updatebot push-regex -r "FROM gcr.io/jenkinsxio/builder-base:(.*)" -v ${VERSION} "*/Dockerfile"
updatebot push-regex -r "FROM gcr.io/jenkinsxio/builder-rubybase:(.*)" -v ${VERSION} "*/Dockerfile"
updatebot push-regex -r "FROM gcr.io/jenkinsxio/builder-swiftbase:(.*)" -v ${VERSION} "*/Dockerfile"
updatebot push-regex -r "\s+- --image=gcr.io/jenkinsxio/builder-base:(.*)" -v ${VERSION} "jenkins-x.yml"
updatebot push-regex -r "\s+- --image=gcr.io/jenkinsxio/builder-rubybase:(.*)" -v ${VERSION} "jenkins-x.yml"
updatebot push-regex -r "\s+- --image=gcr.io/jenkinsxio/builder-swiftbase:(.*)" -v ${VERSION} "jenkins-x.yml"
