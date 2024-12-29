#!/usr/bin/env zsh
set -e

REPO=$1

if [ -z $GIT_REPO_BASE ]; then
  echo "GIT_REPO_BASE environment variable not set. Aborting."
  exit 1;
fi

if [ -z $WORKSPACE ]; then
  echo "WORKSPACE environment variable not set. Aborting."
  exit 1;
fi

REPOS_FILE="$ZSH_CUSTOM/shortcuts.zsh"
PROJECT_SHORTNAME=$(echo $REPO | python /usr/local/bin/shorten.py)
FOLDER="$WORKSPACE/$PROJECT_SHORTNAME"

echo $FOLDER

if [ -d $FOLDER ]; then
  echo "$REPO already checked out to $FOLDER. Skipping clone."
else
  echo "$GIT_REPO_BASE/$REPO.git"
  git clone "$GIT_REPO_BASE/$REPO.git" "$FOLDER"
fi

ALIAS=$(echo $REPO | python /usr/local/bin/make_alias.py)
ALIAS_CMD="alias $ALIAS=\"cd \$WORKSPACE/$PROJECT_SHORTNAME\""

if grep "alias $ALIAS" $REPOS_FILE > /dev/null; then
  echo "alias for $ALIAS already exists. You will need to resolve the alias below manually:"
  echo
  echo "$ALIAS_CMD"
  echo
  exit 1
else
  echo "Installing alias $ALIAS_CMD"
  echo "$ALIAS_CMD" >> "$REPOS_FILE"
fi

"Sorting alias file $REPOS_FILE"
python /usr/local/bin/sort_aliases.py

echo "Success!"
