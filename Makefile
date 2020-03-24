prefix  ?= canelrom1
name    ?= apache2-php7
tag     ?= $(shell date +%Y%m%d.%H%M%S)

DC_FILE ?= docker-compose.yml

all: build

run:
	docker run -it --name $(name) $(prefix)/$(name):latest sh

build: src/Dockerfile
	docker build -t $(prefix)/$(name):$(tag) src
	docker tag $(prefix)/$(name):$(tag) $(prefix)/$(name):latest 

newbuild: src/Dockerfile
	docker build --pull -t $(prefix)/$(name):$(tag) src
	docker tag $(prefix)/$(name):$(tag) $(prefix)/$(name):latest 

start:
	docker run -d -p 80:80 -p 443:443 --name $(name) $(prefix)/$(name):latest

stop:
	docker stop $(name)

rm: stop
	docker rm $(name)

up:
	docker-compose -f $(DC_FILE) up -d

down:
	docker-compose -f $(DC_FILE) down

clean-docker: clean-docker-latest
	docker rmi $(prefix)/$(name):$(tag)

clean-docker-latest:
	docker rmi $(prefix)/$(name):latest

clean: clean-docker clean-old-images


# vim: ft=make
