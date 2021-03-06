# bash-envtpl
Simple envtpl implementation in Bash

## Details
Inspired by [envtpl](https://github.com/andreasjansson/envtpl) written in python this repo is basic equivalent in Bash. The main goal is to avoid the dependency of Python and pip within a Docker container. This saves about 50MB container size.

Most of the time a envtpl template file looks like this:
```
{% for key, value in environment('VAR_PREFIX_') %}{{ key|lower|replace('_','-') }}={{ value }}
{% endfor %}
```

The rendered template is stored to a file.

The bash function `envtpl` performs this work.

```bash
envtpl ENV_PREFIX TARGET_FILE [KEY_DELIMITER='_'] [KEY_DELIMITER_REPLACEMENT='-'] [VALUE_DELIMITER='=']
```

## Usage

1. Copy/paste file [envtpl.sh](envtpl.sh) or bash function envtpl into your entrypoint script
2. Call envtpl function
```bash
#!/usr/bin/env bash
# Source envtpl.sh if file was copied
. envtpl.sh
# E.g APP_API_KEY=mykey stores api.key:mykey into /etc/app/production.conf
envtpl APP_ /etc/app/production.conf '_' '.' ':'
```

## Requirements
- Bash 4.0 (Released 2009)
