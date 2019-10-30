STACK_RESOLVER=lts-14.6
IMAGE_VERSION=0.0.2

.PHONY: build
build:
	docker build -m 4GB -t fugue2/aws-haskell:${IMAGE_VERSION} \
		--build-arg STACK_RESOLVER=${STACK_RESOLVER} .

.PHONY: deploy
deploy:
	docker push fugue2/aws-haskell:${IMAGE_VERSION}
