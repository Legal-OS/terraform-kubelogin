FROM hashicorp/terraform:1.9.5 AS base

RUN apk add --no-cache curl

FROM base AS build

WORKDIR /tmp
RUN curl -L -O https://github.com/Azure/kubelogin/releases/download/v0.1.4/kubelogin-linux-amd64.zip
RUN unzip kubelogin-linux-amd64.zip

FROM base
COPY --from=build /tmp/bin/linux_amd64/kubelogin /bin/kubelogin
