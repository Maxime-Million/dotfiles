#!/bin/bash
# On cherche les symboles correspondant au mot-clé (ex: "arrow", "check", "math")
# uni gère nativement le filtrage avec son argument
uni search "$1" | awk -F"'" '{print $2}' | jq -R -s '
  split("\n")
  | map(select(. != ""))
  | { items: map({ title: ., value: . }) }
'