# Dev Container Features

## Content

This repository contains following features:

* [novops](https://github.com/PierreBeucher/novops): Install novops CLI tools

## Usage

To use the features from this repository, add the desired features to devcontainer.json.

This example use novops feature on devcontainer.

```shell
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/neferites/features/novops:0": {
            "version": "latest"
        }
    }
}
```