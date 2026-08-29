# SectlyOS

SectlyOS is a custom Linux distribution based on [Universal Blue Aurora](https://getaurora.dev/).
It is an opinionated KDE Plasma workstation built on Fedora Atomic and delivered as an OCI container image with atomic updates and rollback.

## Installation

To switch to SectlyOS from an existing bootc system:

```bash
sudo bootc switch ghcr.io/sectly/sectly-os:latest
```

Then reboot.

## Features

- Based on Universal Blue Aurora (KDE Plasma, Fedora Atomic)
- SectlyOS identity and branding
- Atomic updates with instant rollback
- Immutable root filesystem
- SELinux enforcing

## Building Locally

Requirements: podman, just, jq

```bash
just build
```

To build and run a QCOW2 VM image:

```bash
just build-qcow2
just run-vm-qcow2
```

## Switching Back

To return to a previous image:

```bash
sudo bootc rollback
```

Or switch to any other bootc image:

```bash
sudo bootc switch ghcr.io/ublue-os/aurora:stable
```

## Source

- Repository: https://github.com/Sectly/sectly-os
- Base image: ghcr.io/ublue-os/aurora:stable
- Registry: ghcr.io/sectly/sectly-os

## License

Apache 2.0
