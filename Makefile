.PHONY: generate

PROTO_DIR := proto-trial/address-book-tutorial
GEN_DIR := proto-trial/address-book-tutorial/gen
DOCKER_IMAGE := namely/protoc-all:1.47_2

generate:
    docker run --user=$$(id -u):$$(id -g) --rm \
        -v "${PWD}/${PROTO_DIR}":/defs \
        -v "${PWD}/${GEN_DIR}":/output \
        -w /defs \
        $(DOCKER_IMAGE) \
        --lint --go-source-relative \
        -i /defs \
        -d /defs \
        -l go \
        -o /output

