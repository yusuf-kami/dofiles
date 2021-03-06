#!/bin/sh
# Should be linked with .git/hooks/commit-msg
# You can pferform the symlink with the command:
#   rm .git/hooks/*
#   ln -fsv "$(PWD)/git/commit-msg" .git/hooks/commit-msg

printf "\nValidating commit message format...\n\n"

# Regex for the commit message
commit_message_regex='^.+\s-\s.+\s:\s(.+)\.$'

if ! grep -Eq "$commit_message_regex" "$1"; then
cat << EOF >&2

Invalid commit message format

Actual:   $(head -1 "$1")
Expected: $(cat ./git/commit.template)

EOF
  exit 1
fi
