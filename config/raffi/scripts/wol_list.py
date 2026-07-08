#!/usr/bin/env python3
import json
import os

WOL_DIR = "/home/maxime/wakeonlan_files/"

items = []
for fname in sorted(os.listdir(WOL_DIR)):
    if fname.endswith(".wol"):
        full_path = os.path.join(WOL_DIR, fname)
        items.append({
            "title": fname[:-4],
            "subtitle": full_path,
            "arg": full_path
        })

if not items:
    items.append({
        "title": "Aucun fichier .wol trouvé",
        "subtitle": WOL_DIR,
        "arg": ""
    })

print(json.dumps({"items": items}))