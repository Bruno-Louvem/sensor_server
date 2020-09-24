.PHONY: up
up:
	docker run --rm -it -p 50051:50051 sensor_server:latest

.PHONY: build
build:
	docker build . -t sensor_server:latest