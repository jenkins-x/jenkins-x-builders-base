#!/usr/bin/env bash
set -e
set -u 

echo "Building images with version ${VERSION}"

cat /workspace/source/builder-base/Dockerfile > /workspace/source/builder-base/Dockerfile.base.generated
cat /workspace/source/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.base.generated
cat /workspace/source/builder-base/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.base.generated

export JX_HOME=/workspace/source/builder-base/deps
jx install dependencies --all
unset JX_HOME

ls -la /workspace/source/builder-base/deps/bin/

function build_image {
  name=$1
  base=$2
  echo "pack $name uses base image: $base"

  # generate a docker image
  cat /workspace/source/builder-base/Dockerfile.$base > /workspace/source/builder-base/Dockerfile.$name.generated
  cat /workspace/source/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.$name.generated
  cat /workspace/source/builder-base/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.$name.generated
}

build_image "ruby" "rubybase"
build_image "swift" "swiftbase"
