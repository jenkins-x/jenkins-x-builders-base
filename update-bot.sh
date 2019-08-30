#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -f

updatebot push-regex -r \
	'FROM\sgcr.io/jenkinsxio/builder-base:(.*)' \
	'FROM\sgcr.io/jenkinsxio/builder-rubybase:(.*)' \
	'FROM\sgcr.io/jenkinsxio/builder-swiftbase:(.*)' \
	'\s+-\s--image=gcr.io/jenkinsxio/builder-base:(.*)' \
	'\s+-\s--image=gcr.io/jenkinsxio/builder-rubybase:(.*)' \
	'\s+-\s--image=gcr.io/jenkinsxio/builder-swiftbase:(.*)' \
	-v ${VERSION} \
	 \*/Dockerfile jenkins-x.yml
