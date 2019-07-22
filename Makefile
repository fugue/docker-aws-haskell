STACK_RESOLVER=lts-13.0

.PHONY: build
build:
	docker build -m 4GB -t fugue2/aws-haskell \
		--build-arg STACK_RESOLVER=${STACK_RESOLVER} .

.PHONY: deploy
deploy:
	docker push fugue2/aws-haskell
