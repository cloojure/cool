#!/bin/tcsh
set refNum0 = $1
@ refNum1 = $refNum0 + 1
echo "refNum0: $refNum0    refNum1: $refNum1" 
git difftool --no-prompt "master@{$refNum0}" "master@{$refNum1}" src/ocr/core.clj
