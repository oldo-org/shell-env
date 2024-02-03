#! /bin/bash

find -type d -regex '\.[/a-z-]*' -exec generate-index-html.sh {} ';'
