#!/bin/bash
set -a
. $1
set +a

function brand() {
    sed -e "s,{brandname},$BRANDNAME," \
        -e "s,{website},$WEBSITE," \
        -e "s,{serverImage},$SERVER_IMAGE," \
    $1 > $2
}

brand README.md.tpl README.md
brand values.schema.json.tpl values.schema.json
