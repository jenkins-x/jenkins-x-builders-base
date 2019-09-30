#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr docker \
    --name gcr.io/jenkinsxio/builder-base \
    --name gcr.io/jenkinsxio/builder-rubybase \
    --name gcr.io/jenkinsxio/builder-swiftbase \
    --version ${VERSION} \
    --repo https://github.com/jenkins-x/jenkins-x-builders.git \
    --repo https://github.com/jenkins-x/jenkins-x-builders-ml.git

jx step create pr regex \
    --regex '\s+-\s--image=gcr.io/jenkinsxio/builder-base:(.*)' \
    --regex '\s+-\s--image=gcr.io/jenkinsxio/builder-rubybase:(.*)' \
    --regex '\s+-\s--image=gcr.io/jenkinsxio/builder-swiftbase:(.*)' \
    --version ${VERSION} \
    --files jenkins-x.yml \
    --repo https://github.com/jenkins-x/jenkins-x-builders.git \
    --repo https://github.com/jenkins-x/jenkins-x-builders-ml.git
