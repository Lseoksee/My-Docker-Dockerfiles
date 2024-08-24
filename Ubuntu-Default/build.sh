docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x --push -t da864268/my-ubuntu .
docker buildx build --build-arg "BASE_VERSION=22.04" --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x --push -t da864268/my-ubuntu:22.04 .
docker buildx prune -f --all