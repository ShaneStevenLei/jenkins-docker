# jenkins-docker

## Dependency

- [docker](https://docs.docker.com/get-started/get-docker/)
- [make](https://www.gnu.org/software/make/manual/make.html)

## Environment

- Copy `.env.example` to `.env`

```shell
cp .env.example .env
```

- Modify the image registry address and version

```
REGISTRY=xxxxx
VERSION=lts-jdk17
```

## Build and push image

```shell
make
```
