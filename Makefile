NAME = rcdev/node

all: build

build:
	docker build -t $(NAME) .

