FROM golang:1.20-alpine
WORKDIR /go/src/github.com/JDsnyke/ssl-proxy
RUN apk add --no-cache make git zip
COPY . .
RUN make 
