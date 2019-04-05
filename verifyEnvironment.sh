verify(){
  echo "*************** begin testing environment **********"
  echo ;
  echo "ensure matches; ensure content between begin and end ... not empty."
  echo "begin $(which npm) end"
  echo "begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/npm end"
  echo ;
  echo "ensure matches; ensure content between begin and end ... not empty."
  echo "begin $(which yarn) end"
  echo "begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/yarn end"

  echo ;
  echo "verify only one lock file exists for this repo:"
  echo "$(ls | grep lock |  grep "pack\|yarn")"
  echo ;
  echo "*************** end testing environment **********"
  echo ;
}
verify

## future tests
## usage: which [-as] program ...
## -bash: config: command not found
## nvm is not compatible with the npm config "prefix" option: currently set to ""
## Run `npm config delete prefix` or `nvm use --delete-prefix v8.15.0 --silent` to unset it.
## 
## behavior occurs if no package.lock detected on a new terminal session.
## when the if condition for if no .lock files has the code which $1.
## this has been changed to which $1 $* and is now working.
