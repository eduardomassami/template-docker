FROM golang:1.16-alpine

# Add Maintainer info
LABEL maintainer="Eduardo Massami Uchida <massami.uchida@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the Go app
RUN go build -o /template-docker

EXPOSE 8000

CMD [ "/template-docker" ]