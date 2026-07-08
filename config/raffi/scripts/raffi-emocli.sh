#!/bin/bash
# $1 contient la recherche transmise par Raffi ({query})
emocli "$1" | perl -C -pe 's/(\X)/$1\n/g' | jq -R -s '
  split("\n")
  | map(select(. != ""))
  | { items: map({ title: ., value: . }) }
'