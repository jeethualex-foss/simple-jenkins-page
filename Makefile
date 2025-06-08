app := simple-jenkins-page
user :=
pass :=
image :=

default: login

publish: clean build_api deploy_api build_jenkins deploy_jenkins build deploy

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(image) .
	docker push $(image)

build_api:
	docker build -t $(image)-api api
	docker push $(image)-api

build_jenkins:
	docker build -t $(image)-jenkins jenkins
	docker push $(image)-jenkins

deploy_api:
	docker stop api || true && docker rm api || true
	docker run --name api -d -p 8080:8080 $(image)-api

deploy_jenkins:
	docker stop jenkins || true && docker rm jenkins || true
	docker run --privileged --name jenkins -d -p 8081:8080 $(image)-jenkins

deploy:
	docker stop $(app) || true && docker rm $(app) || true
	docker run --name $(app) --link api:rest -d -p 80:80 $(image)

debug:
	docker exec -it $(app) sh

clean:
	docker rm api -f
	docker rm $(app) -f
	docker rm jenkins -f
	docker rmi $(image)-jenkins -f
	docker rmi $(image)-api -f
	docker rmi $(image) -f
