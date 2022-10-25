FROM golang:1.18-alpine3.16 AS builder
WORKDIR /app
COPY . .
RUN go build -v -o /app/demo



FROM alpine:3.16
WORKDIR /usr/local/bin/ 
EXPOSE 8080
COPY --from=builder /app/demo /usr/local/bin/demo
RUN chmod +x /usr/local/bin/demo
CMD ["/usr/local/bin/demo"]
