CURRENT = 7.3
CURRENT_LONG = 7.3-alpine3.10

REGISTRY = docker.pkg.github.com/shotanue/swoole-app/docker

.PHONY = all build test push

all: build test push

build:

	docker image build --target ship --tag $(REGISTRY):$(CURRENT) --tag $(REGISTRY):$(CURRENT_LONG) $(CURRENT)
	docker image build --target ship-dev --tag $(REGISTRY):$(CURRENT)-dev --tag $(REGISTRY):$(CURRENT_LONG)-dev $(CURRENT)

#test:
#	docker container run --rm --tty $(REGISTRY):latest --no-ansi | grep 'swoole'
#	docker container run --rm --tty $(REGISTRY):$(CURRENT) --no-ansi | grep 'swoole'
#	docker container run --rm --tty $(REGISTRY):$(CURRENT_LONG) --no-ansi | grep 'swoole'
#
#	docker container run --rm --tty $(REGISTRY):latest-dev --no-ansi | grep 'swoole'
#	docker container run --rm --tty $(REGISTRY):$(CURRENT)-dev --no-ansi | grep 'swoole'
#	docker container run --rm --tty $(REGISTRY):$(CURRENT_LONG)-dev --no-ansi | grep 'swoole'

push:
	docker image push $(REGISTRY):$(CURRENT)
	docker image push $(REGISTRY):$(CURRENT_LONG)

	docker image push $(REGISTRY):$(CURRENT)-dev
	docker image push $(REGISTRY):$(CURRENT_LONG)-dev
