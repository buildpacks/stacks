#!/usr/bin/env bash

usage() { echo "Usage: $0 [-v <image version>]" 1>&2; exit 1; }
version=dev

while getopts "v" o; do
  case "${o}" in
    v)
      version=${OPTARG}
      [[ -n ${version} ]] || usage
      ;;
    *)
      usage
      ;;
  esac
done

docker pull ubuntu:bionic

scripts_dir=$(cd $(dirname $0) && pwd)
dir=${scripts_dir}/../bionic

base_image=packs/base:${version}
run_image=packs/run:${version}
build_image=packs/build:${version}
docker build -t "${base_image}" "$dir/base"
docker build --build-arg "base_image=${base_image}" -t "${build_image}"  "$dir/build"
docker build --build-arg "base_image=${base_image}" -t "${run_image}" "$dir/run"

echo "To publish these images:"
for image in "${base_image}" "${run_image}" "${build_image}"; do
  echo "  docker push ${image}"
done
