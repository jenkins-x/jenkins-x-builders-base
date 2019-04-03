#!/usr/bin/env bash
set -e
set -u 

echo "Building images with version ${VERSION}"

cat /workspace/source/builder-base/Dockerfile > /workspace/source/builder-base/Dockerfile.base
cat /workspace/source/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.base
cat /workspace/source/builder-base/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.base

function build_image {
  name=$1
  base=$2
  echo "pack $name uses base image: $base"

  # generate a docker image
  cat /workspace/source/builder-base/Dockerfile.$base > /workspace/source/builder-base/Dockerfile.$name
  cat /workspace/source/Dockerfile.common >> Dockerfile.$name
  cat /workspace/source/builder-base/Dockerfile.common >> /workspace/source/builder-base/Dockerfile.$name
}

build_image "ruby" "rubybase"
build_image "swift" "swiftbase"
