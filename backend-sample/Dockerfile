FROM golang:1.14.0-stretch AS build
LABEL maintainer="sample-team"
ENV GO111MODULE=on
ENV GOCACHE=/tmp/.cache
ENV GOPRIVATE=github.com/mycompany
ARG TOKEN
WORKDIR /app
COPY ./ ./
RUN git config --global url."https://${TOKEN}:x-oauth-basic@github.com/".insteadOf "https://github.com/"
RUN go mod download
RUN GO111MODULE=on CGO_ENABLED=0 go build -i -o backend-sample

# Now build the final container
FROM debian:stretch
LABEL maintainer="sample-team"
EXPOSE 9090
COPY --from=build /app/backend-sample /usr/local/bin/backend-sample
RUN apt-get update
ENTRYPOINT ["/usr/local/bin/backend-sample"]
