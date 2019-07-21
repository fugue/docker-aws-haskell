STACK_RESOLVER=lts-13.0

.PHONY: build
build:
	docker build -m 4GB -t aws-haskell \
		--build-arg STACK_RESOLVER=${STACK_RESOLVER} \
		.
