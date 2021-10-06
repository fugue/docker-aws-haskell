STACK_RESOLVER=lts-17.9
IMAGE_VERSION=0.0.8

.PHONY: build
build:
	docker build -m 4GB -t fugue2/aws-haskell:${IMAGE_VERSION} \
		--build-arg STACK_RESOLVER=${STACK_RESOLVER} .

.PHONY: deploy
deploy:
	docker push fugue2/aws-haskell:${IMAGE_VERSION}
