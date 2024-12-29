#!/usr/bin/env python
# The purpose of this script is to generate the alias name from a git
# repository name. It's basically shortened to be the first letter of each
# term, where terms are words separated by dash
import sys

DELIMITER = "-"


def extract_alias(name: str) -> str:
    name_witout_suffix = name.replace(".git", "")
    alias = ""
    for i, s in enumerate(name_witout_suffix.split(DELIMITER)):
        alias += s[0]
    return alias


for line in sys.stdin:
    repo = line.split("/")[-1]
    sys.stdout.write(extract_alias(repo))
