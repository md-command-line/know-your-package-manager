# know-your-package-manager
Check and resolve if this repo uses npm or yarn.

## Example Output of npm command: 
```bash
npm start;
# *************** begin testing environment **********
# 
# ensure matches; ensure content between begin and end ... not empty.
# begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/npm end
# begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/npm end
# 
# ensure matches; ensure content between begin and end ... not empty.
# begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/yarn end
# begin /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/yarn end
# 
# verify only one lock file exists for this repo:
# yarn.lock
# 
# *************** end testing environment **********
# 
# yarn run v1.13.0
# error Couldn't find a package.json file in "/Users/michaeldimmitt/new_c/97_lunchpool/know-your-package-manager"
# info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
# 
# you just experienced /Users/michaeldimmitt/.nvm/versions/node/v8.15.0/bin/yarn 
# because: a lock file was found "yarn.lock"
```

## Setup for current implementation.
add the following lines to your relavent rc file:
```vim
yarn(){
  bash $HOME/know-your-package-manager/managePackage.sh yarn $H $*
}
npm(){
  bash $HOME/know-your-package-manager/managePackage.sh npm $H $*
}
```

use the command below to open your relevant rc file: 
```bash
cd $HOME &&
git clone https://github.com/MichaelDimmitt/know-your-package-manager.git &&
shellVariable=$(echo $0 | cut -c 2-100) &&
rcfile = $(echo ".${shellVariable}rc") && 
vi $HOME/$rcfile
```

## Alternatively, add the following to your bashrc:


## Future implementation ... homebrew tap.
```bash
# bash
brew tap michaeldimmitt/taps && 
brew install know-your-package-manager

# program will add two functions to your rc file: 
yarn(){
  know-your-package-manager $H $*
}
npm(){
  know-your-package-manager $H $*
}
```

## Future implementation ... global nodemodule:
Simular to homebrew install experience.


### get details about the environment of the repo/nonrepo you are on by running verify.sh in the project.
