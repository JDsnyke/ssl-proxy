BINARY = ssl-proxy

.PHONY: build
build:
	go mod download
	go build -o ${BINARY}

.PHONY: test
test:
	go test -v ./...

.PHONY: run
run:
	make build
	./${BINARY}

.PHONY: release
release: 
	go mod download	
	GOOS=linux GOARCH=arm64 go build -o build/${BINARY}-linux-arm64 .;
	GOOS=linux GOARCH=arm64 go build -o build/${BINARY}-linux-aarch64 .;
	GOOS=linux GOARCH=amd64 go build -o build/${BINARY}-linux-amd64 .;
	cd build; \
	tar -zcvf ssl-proxy-linux-arm64.tar.gz ssl-proxy-linux-arm64; \
	tar -zcvf ssl-proxy-linux-aarch64.tar.gz ssl-proxy-linux-aarch64; \
	tar -zcvf ssl-proxy-linux-amd64.tar.gz ssl-proxy-linux-amd64;
