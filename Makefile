NAME  = centos8
TAG   = latest
IMAGE = kiyotune/$(NAME):$(TAG)
SRC   = ./Dockerfile

all:
	docker build -t $(IMAGE) .
push:
	docker push $(IMAGE)
run:
	docker run --detach --name $(NAME) --privileged --publish=8080:80 $(IMAGE) /sbin/init
open:
	docker exec -it $(NAME) bash
stop:
	docker stop $(NAME)
rm:
	docker rm $(NAME)
rmi:
	docker rmi $(IMAGE)
ps:
	docker ps -a
