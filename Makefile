DNAME  ?= centos8
TAG   ?= latest
IMAGE = kiyotune/$(DNAME):$(TAG)
SRC   = ./Dockerfile.$(DNAME)

all:
	docker build -f $(SRC) -t $(IMAGE) .
push:
	docker login
	docker push $(IMAGE)
pull:
	docker login
	docker push $(IMAGE)
run:
	docker run --detach --name $(DNAME) --privileged --publish=8000:8000 --publish=8080:80 $(IMAGE) /sbin/init
open:
	docker exec -it $(DNAME) /bin/bash
start:
	docker start $(DNAME)
stop:
	docker stop $(DNAME)
rm:
	docker stop $(DNAME)
	docker rm $(DNAME)
rmi:
	docker rmi $(IMAGE)
ps:
	docker ps -a
