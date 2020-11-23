# Httpd Docker image with Open SSH server

This is the httpd image with opnessh-server installed.

Use this image for services that require ssh for maintenance, such as Azure App Service (Web App for Containers) on Linux.

Please be careful about security when using it in an open network.

## How to use this image

```
docker run -d --rm --name httpd-sshd -p 8000:80 -p 2222:2222 seigetsu/httpd-sshd:2.4-alpine
```

## Tags

- `:<baseimage-tag>` : latest version of this image based on the image of `httpd:<baseimage-tag>`.
- `:<baseimage-tag>-<version>` : Specific version of this image based on the image of `httpd:<baseimage-tag>`.

## Environment Variables

- `ROOT_PASSWORD` : password for root user of SSH.
- `SSH_PORT` : Port of SSH. Default `2222`

## Relationship between Source code and Docker image tag

- `<baseimage-tag>` : see directory.
- `<version>` : see branch.

Example:

`seigetsu/httpd-sshd:2.4-alpine-v1.0` :

- branch `v1.0`
- directory `2.4-alpine`

## Automated Build configurations

- SOURCE REPOSITORY : `kofuseigetsu/docker-httpd-sshd`
- AUTOTEST : `Off`
- REPOSITORY LINKS : `Off`
- BUILD RULES :  
  | Source Type | Source | Docker Tag | Dockerfile location | Build Context | Autobuild | Build Caching |
  | -------| -------------- | --------------- | ---------- | ----------- | --- | --- |
  | Branch | main           | 2.4-alpine      | Dockerfile | /2.4-alpine | Yes | No  |
  | Branch | /^(v[0-9.]+)$/ | 2.4-alpine-{\1} | Dockerfile | /2.4-alpine | Yes | No  |
  