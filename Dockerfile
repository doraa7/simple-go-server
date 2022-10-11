FROM golang:1.18-alpine3.16 AS builder
WORKDIR /app
COPY . .
RUN go build -v -o demo



FROM alpine:3.16
EXPOSE 8080
CMD ["demo"]
COPY --from=builder /app/demo /usr/local/bin/demo
RUN chmod +x /usr/local/bin/demo
