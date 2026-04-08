#!/bin/bash

# This script runs the exact pipeline you provided:
# 1. Takes words.txt
# 2. Converts spaces to newlines
# 3. Saves to a temp file (data.txt)
# 4. Uses xargs to echo the word and grep the count

cat words.txt | tr ' ' '\n' | tee data.txt | xargs -I {} sh -c 'echo -n "{} "; grep -c "^{}$" data.txt'

# 2. Remove the temporary file created by tee
rm data.txt