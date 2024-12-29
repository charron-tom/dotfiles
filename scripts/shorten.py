#!/usr/bin/env python
# The purpose of this script is to shorten the string name of a repoistory
# that may be under nested folders by retrieving the last item in the path
# i.e. a/b/c/d => d, x/y/z => z
# 
# This could probably be accomplished with a shell one liner, but whatever.

import sys

for line in sys.stdin:
    repo = line.split("/")[-1]
    sys.stdout.write(repo)
