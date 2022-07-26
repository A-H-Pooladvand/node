## Node Application Docker

The node application docker is a simple docker image that can be used to run a node application.

## Getting started
- [Install requirements](#install-requirements)
- [Quick start](#quick-start)

### Install requirements
```shell
git
make
docker
docker compose
```

### Quick Start
* Copy .env.example to .env
* Change the values in .env to match your environment
* Run `make build` to build the docker image
* If you want to run the application in the foreground, run `make up`
* If you want to run the application in the background, run `make watch`

### Commands

To list all available commands, run:

```shell
make help
```