FROM golang:1.18-bullseye AS builder

WORKDIR /usr/src

COPY . .
RUN go mod download && go mod verify

RUN go build -o main


FROM scratch

WORKDIR /usr/src

COPY --from=builder /usr/src/main .

CMD ["./main"]