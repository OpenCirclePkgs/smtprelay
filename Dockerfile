FROM golang:1.16-alpine AS builder

RUN ls -la

WORKDIR /app
COPY /external_repo/ .

# Debug
RUN ls -la
RUN go version && go env

RUN go build -o smtprelay .


FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/smtprelay .


EXPOSE 25
EXPOSE 465
EXPOSE 587

# Command to run the executable
CMD ["./smtprelay"]