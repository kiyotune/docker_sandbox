NAME  = centos8
TAG   = latest
IMAGE = kiyotune/$(NAME):$(TAG)
SRC   = ./Dockerfile

all:
	docker build -t $(IMAGE) .
push:
	docker login
	docker push $(IMAGE)
push:
	docker login
	docker push $(IMAGE)
run:
	docker run --detach --name $(NAME) --privileged --publish=8000:8000 --publish=8080:80 $(IMAGE) /sbin/init
open:
	docker exec -it $(NAME) bash
stop:
	docker stop $(NAME)
rm:
	docker stop $(NAME)
	docker rm $(NAME)
rmi:
	docker rmi $(IMAGE)
ps:
	docker ps -a
