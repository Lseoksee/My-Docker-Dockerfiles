docker buildx build --platform linux/amd64,linux/arm64 --push -t da864268/conda .
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0 && docker rmi moby/buildkit:buildx-stable-1
