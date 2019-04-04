verify(){
  echo "*************** begin testing environment **********"
  echo "$(which npm)"
  echo "matches"
  echo "/Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/npm"

  echo "verify lock exists:"
  echo "$(ls | grep lock | cut -c 1-4)"
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
