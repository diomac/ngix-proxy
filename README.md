# Nginx Proxy

![nginx-logo](https://www.nginx.com/wp-content/uploads/2019/10/favicon-48x48.ico)

This project sets up an Nginx proxy using Docker Compose. It provides a reverse proxy for routing incoming requests to different backend services.

## Prerequisites

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)
- Make: [Install Make](https://link-to-install-make)

## Getting Started

To start the project, follow these steps:

1. Clone this repository: `git clone https://github.com/your-username/nginx-proxy.git`
2. Navigate to the project directory: `cd nginx-proxy`
3. Start the project using Make: 

```shell
make dev
```

This command will check if Docker is running, create the 'diomac' network if it doesn't exist, and start the Nginx proxy service.

Access your services through the Nginx proxy by configuring their upstreams in the Nginx configuration file provided in `nginx.conf`.

Make sure to map the following environment variables in the containers that will be redirected by the proxy:

- `VIRTUAL_HOST`: The hostname or domain name associated with the service. Example: `example.com`
- `VIRTUAL_PATH`: The path prefix or pattern to match for the service. Example: `/api`
- `VIRTUAL_PORT`: The port on which the service is listening. Example: `8080`

These environment variables will be used by the Nginx proxy to route the incoming requests to the correct backend service.

Example YAML snippet:

```yml
expose:
  - 8080
environment:
  - VIRTUAL_PATH=/api
  - VIRTUAL_HOST=diomacpc
  - VIRTUAL_PORT=8080 # default 80
```

## Stopping and Cleaning up

To stop and delete all containers and the 'diomac' network, run the following command:

```shell
make down
```

This command will stop and remove the containers managed by Docker Compose and delete the 'diomac' network.

Make sure to run this command only when you want to completely stop and remove the project.

## Tags

- nginx
- proxy
- docker
- reverse-proxy
