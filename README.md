# APRSGateway OCI Container

This builds an OCI compliant container image running the G4KLX's
[APRSGateway](https://github.com/g4klx/APRSGateway).

## Tools (required to build)

- [Buildah](https://buildah.io/)
- [qemu-user-static](https://github.com/multiarch/qemu-user-static) (for
  multi-arch builds)

## Building
To build and push a multi-arch image to Docker Hub at `sq7lrx/aprsgateway`:

```sh
git clone https://github.com/sq7lrx/aprsgateway-docker.git
cd aprsgateway-docker
export IMAGE=docker.io/sq7lrx/aprsgateway
./build.sh
```
