checkLockFiles(){
  result=$(echo "$1" | wc -l);
  if [ "$result" -ge "2" ]; then
    echo 'two or more lock files detected ... please delete one to continue';
  elif [ "$1" == "pack" ]; then
    which npm;
  elif [ "$1" == "yarn" ]; then
    which yarn;
  elif [ "$(ls | grep lock | cut -c 1-4 | wc -l)" -eq "0" ]; then
    which $1 $*
  else
    which $1
  fi;
};

helper(){
  source ./verifyEnvironment.sh
  lockFilesFound=$(ls | grep lock | cut -c 1-4 | grep "pack\|yarn")

  packageManager=$(checkLockFiles "$(echo "$lockFilesFound")" npm)
  $packageManager $*;
};

helper $1
