# bash-envtpl
Simple envtpl implementation in bash

## Details
Inspired by [envtpl](https://github.com/andreasjansson/envtpl) written in python this repo is basic equivalent in bash. The main goal is to avoid the dependency of python and pip within a Docker container.

Most of the time a envtpl template file looks like this:
```
{% for key, value in environment('VAR_PREFIX_') %}{{ key|lower|replace('_','-') }}={{ value }}
{% endfor %}
```

The rendered template is stored to a file.

The bash function `envtpl` performs this work.

## Usage

1. Copy/paste file envtpl.sh or bash function envtpl into your entrypoint script
2. Call envtpl function
```
# Source envtpl.sh if file was copied
. envtpl.sh
# E.g APP_API_KEY=mykey stores api.key=mykey into /etc/app/production.conf
envtpl APP_ /etc/app/production.conf _ .
```
