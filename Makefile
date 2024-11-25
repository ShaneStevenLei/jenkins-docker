REGISTRY=shanestevenlei
IMAGE=${REGISTRY}/jenkins
VERSION=lts-jdk17
LATEST_VERSION=latest

include .env

all: build-push build-push-latest clean

build:
	@echo "Building: $(IMAGE):$(VERSION)..."
	docker build -t $(IMAGE):$(VERSION) --build-arg JENKINS_VERSION=${VERSION} -f ./Dockerfile .
	@echo "Built successfully: $(IMAGE):$(VERSION)"

push:
	@echo "Pushing image: $(IMAGE):$(VERSION)..."
	docker push $(IMAGE):$(VERSION)
	@echo "Pushed successfully: $(IMAGE):$(VERSION)"

build-latest:
	@echo "Building latest: $(IMAGE):$(LATEST_VERSION)..."
	docker build -t $(IMAGE):$(LATEST_VERSION) --build-arg JENKINS_VERSION=${VERSION} -f ./Dockerfile .
	@echo "Built successfully: $(IMAGE):$(LATEST_VERSION)"

push-latest:
	@echo "Pushing image: $(IMAGE):$(LATEST_VERSION)..."
	docker push $(IMAGE):$(LATEST_VERSION)
	@echo "Pushed successfully: $(IMAGE):$(LATEST_VERSION)"

build-push: build push

build-push-latest: build-latest push-latest

clean:
	@echo "Cleaning: $(IMAGE):$(VERSION)..."
	docker rmi $(IMAGE):$(VERSION)
	@echo "Cleaning: $(IMAGE):$(LATEST_VERSION)..."
	docker rmi $(IMAGE):${LATEST_VERSION}

.PHONY: build push build-push
