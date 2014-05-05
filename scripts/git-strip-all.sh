#!/bin/bash
# A repo-wide git stripspace on all non-binary files.

TMPFILE=`mktemp -t git-strip-all`

LIST_GIT_FILES_CMD=`git grep --cached -I -l -e $''`

for file in $LIST_GIT_FILES_CMD
do
	git stripspace < $file > $TMPFILE
	cat $TMPFILE > $file
done
