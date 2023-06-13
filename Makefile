.PHONY: setup
setup:
	mkdir -p generated
	mkdir -p generated/id-checker

.PHONY: generate
generate: setup id-checker

.PHONY: id-checker
key-service:
	protoc -I . \
		--go_out ./generated/id-checker --go_opt paths=source_relative \
		--go-grpc_out ./generated/id-checker --go-grpc_opt paths=source_relative \
		v1/id-checker.proto

