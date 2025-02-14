#!/bin/zsh 

tgt='rb.backend.api.rest.enduser.railsbank-as-customer'
for ff in $(grep -l ${tgt}  **/*.clj) ; do 
  ls -ldF $ff
  sed -i '' "s/${tgt}/tst.${tgt}/" $ff 
done

