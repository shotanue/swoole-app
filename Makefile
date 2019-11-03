CURRENT = 7.3-alpine3.10
CURRENT_SHORT = 7.3

REGISTRY = docker.pkg.github.com/shotanue/swoole-app/docker

.PHONY = all build push

all: build push

build:

	docker image build --target ship --tag $(REGISTRY):$(CURRENT) $(CURRENT_SHORT)
	docker image build --target ship-dev --tag $(REGISTRY)-dev:$(CURRENT) $(CURRENT_SHORT)

push:
	docker image push $(REGISTRY):$(CURRENT)
	docker image push $(REGISTRY)-dev:$(CURRENT)
