# run 'make help' for targets

WORK=.tmp

.PHONY: build localbuild clean realclean help

build:          ## build the images using codeship jet
build: ${WORK}/.build

localbuild:     ## build the images using docker-compose
localbuild:
	docker-compose build

clean:          ## remove the official image tag
	rm -f ${WORK}/.build
	-docker images \
	    | grep 'cjengineering/codeship-' \
			| cut -d ' ' -f 1 \
			| xargs docker rmi -f


realclean:      ## clean and remove all controls
realclean: clean
	rm -rf ${WORK}


help:           ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//' \
    | sed 's/^/make /'

${WORK}/.build: ${WORK} \
		$(shell find src -type f) \
		codeship-services.yml \
		codeship-steps.yml
	jet steps
	touch ${WORK}/.build

${WORK}:
	mkdir -p ${WORK}
