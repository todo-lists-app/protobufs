.PHONY: setup
setup:
	mkdir -p generated
	mkdir -p generated/id_checker

.PHONY: generate
generate: setup id_checker

.PHONY: id_checker
id_checker:
	protoc -I . \
		--go_out ./generated/id_checker --go_opt paths=source_relative \
		--go-grpc_out ./generated/id_checker --go-grpc_opt paths=source_relative \
		v1/id_checker.proto

