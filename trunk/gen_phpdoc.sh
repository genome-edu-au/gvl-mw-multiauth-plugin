#!/bin/bash

# for utf-8 support edit
# /usr/share/php/data/PhpDocumentor/phpDocumentor/Converters/HTML/frames/templates/default/templates/header.tpl

phpdoc -pp on -s on -is -dn MultiAuthPlugin -d src/main/php/ -t phpdoc
