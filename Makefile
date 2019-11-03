CURRENT = 7.3
CURRENT_LONG = 7.3-alpine3.10

GITHUB_REPO = swoole-app

.PHONY = all build test push

all: build test push

build:
	docker image build --target ship --tag swoole-app:$(CURRENT) --tag swoole-app:$(CURRENT_LONG) --tag swoole-app:latest $(CURRENT)
	docker image build --target ship-dev --tag swoole-app:$(CURRENT)-dev --tag swoole-app:$(CURRENT_LONG)-dev --tag swoole-app:latest-dev $(CURRENT)

#test:
#	docker container run --rm --tty swoole-app:latest --no-ansi | grep 'swoole'
#	docker container run --rm --tty swoole-app:$(CURRENT) --no-ansi | grep 'swoole'
#	docker container run --rm --tty swoole-app:$(CURRENT_LONG) --no-ansi | grep 'swoole'
#
#	docker container run --rm --tty swoole-app:latest-dev --no-ansi | grep 'swoole'
#	docker container run --rm --tty swoole-app:$(CURRENT)-dev --no-ansi | grep 'swoole'
#	docker container run --rm --tty swoole-app:$(CURRENT_LONG)-dev --no-ansi | grep 'swoole'

push:
	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):latest
	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):$(CURERNT)
	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):$(CURERNT_LONG)

	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):latest-dev
	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):$(CURERNT)-dev
	docker image push docker.pkg.github.com/shotanue/$(GITHUB_REPO):$(CURERNT_LONG)-dev
