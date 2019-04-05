checkLockFiles(){
  result=$(echo "$1" | wc -l);
  if [ "$result" -ge "2" ]; then
    echo 'two or more lock files detected ... please delete one to continue';
  elif [ "$1" == "pack" ]; then
    which npm;
  elif [ "$1" == "yarn" ]; then
    which yarn;
  elif [ "$(ls | grep lock | cut -c 1-4 | wc -l)" -eq "0" ]; then
    echo 'no lock file found'
  else
    which $1
  fi;
};

helper(){
  lockFilesFound=$(ls | grep lock | cut -c 1-4 | grep "pack\|yarn")
  echo "$(checkLockFiles "$(echo "$lockFilesFound")") $*";
};

dispatch(){
 source ./verifyEnvironment.sh
 pM=$1
 shift
 if [ "$(helper $H $*)" = "undefined" ]; then
    $(which $pM) $H $*
    # here we do not display a message ... other libraries may be using normal npm.
    # this package aims to ensure there are no issues with normal package management operations.
  elif [ "$(echo "$(helper))" | cut -c 1-7)" = "no lock" ]; then
   $(which $pM) $* $H
   echo ;
   echo "you just experienced $pM"
   echo 'because: no lock file found'
  elif [ "$(echo "$(helper))" | cut -c 1-31)" = "two or more lock files detected" ]; then
   $(which $pM) $* $H
   echo ;
   echo "you just experienced $pM"
   echo 'because: two or more lock files found'
 else
   $(helper) $H $*
   echo ;
   echo "you just experienced $(helper)"
   echo "because: a lock file was found \"$(ls | grep lock)\""
 fi
}
