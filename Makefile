# run 'make help' for targets

WORK=.tmp

.PHONY: build clean realclean help

build:          ## build the images using docker-compose
build: ${WORK}/.build

clean:          ## remove the official image tag
	rm -f ${WORK}/.build
	docker rmi \
		cjengineering/codeship-git \
		cjengineering/codeship-aws-ecs-deploy \
		cjengineering/codeship-aws-cli \
		cjengineering/codeship-aws-base

realclean:      ## clean and remove all controls
realclean: clean
	rm -rf ${WORK}


help:           ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//' \
    | sed 's/^/make /'

${WORK}/.build: ${WORK} \
		$(shell find src -type f) \
		docker-compose.yml
	docker-compose build
	touch ${WORK}/.build

${WORK}:
	mkdir -p ${WORK}
