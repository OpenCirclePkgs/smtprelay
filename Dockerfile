FROM golang:1.16-alpine AS builder

# Dummy instruction to prevent caching
ARG CACHEBUST=1
RUN echo "CACHEBUST=$CACHEBUST"


RUN mkdir /app
RUN ls ../
RUN ls .
RUN ls ../external_repo
COPY ../external_repo /app

WORKDIR /app
RUN go build -o smtprelay .


FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/smtprelay .

EXPOSE 25
EXPOSE 465
EXPOSE 587

# Command to run the executable
CMD ["./smtprelay"]
