#! /bin/bash

find -type d -regex '\.[a-z/_-]*' -exec generate-index-html.sh {} ';'
