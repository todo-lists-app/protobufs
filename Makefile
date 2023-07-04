.PHONY: setup
setup:
	mkdir -p generated
	mkdir -p generated/id_checker
	mkdir -p generated/ping
	mkdir -p generated/todo

.PHONY: generate
generate: setup id_checker ping todo

.PHONY: id_checker
id_checker:
	protoc -I . \
		--go_out ./generated/id_checker --go_opt paths=source_relative \
		--go-grpc_out ./generated/id_checker --go-grpc_opt paths=source_relative \
		v1/id_checker.proto

.PHONY: ping
ping:
	protoc -I . \
		--go_out ./generated/ping --go_opt paths=source_relative \
		--go-grpc_out ./generated/ping --go-grpc_opt paths=source_relative \
		v1/ping.proto

.PHONY: todo
todo:
	protoc -I . \
		--go_out ./generated/todo --go_opt paths=source_relative \
		--go-grpc_out ./generated/todo --go-grpc_opt paths=source_relative \
		v1/todo.proto

