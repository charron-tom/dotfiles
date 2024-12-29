#!/usr/bin/env python
# The purpose of this script is to sort the aliases file after a new one is
# added to maintain alphabetical order.
import os


REPOS_FILE = os.path.join(os.environ["ZSH_CUSTOM"], "shortcuts.zsh")

WORKSPACE = os.environ["WORKSPACE"]

comments = []
aliases = []

with open(REPOS_FILE, "r") as f:
    for line in f:
        if line.startswith("#"):
            comments.append(line)
            continue

        # prune out any aliases that don't have repos
        d = line.strip().split("$WORKSPACE/")[-1].replace("\"", "")
        p = os.path.join(WORKSPACE, d)
        if not os.path.exists(os.path.join(WORKSPACE, d)):
            print(f"removed alias for {d}. {p} does not exist on the filesystem")
        else:
            aliases.append(line)


# report on any missing aliases
for d in os.listdir(WORKSPACE):
    if os.path.isdir(os.path.join(WORKSPACE, d)):
        found = False
        for alias in aliases:
            if d in alias:
                found = True
                break
        if not found:
            print(f"No alias found for {d}")


# rewrite the file with the aliases sorted alphabetically
aliases.sort(key=lambda line: line.split("alias ")[1])
with open(REPOS_FILE, "w") as f:
    for line in comments:
        f.write(line)
    for line in aliases:
        f.write(line)
