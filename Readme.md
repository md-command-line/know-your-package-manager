# know-your-package-manager
Check and resolve if this repo uses npm or yarn.

## Setup for current implementation.
add the following lines to your relavent rc file:
```vim
yarn(){
  bash $HOME/know-your-package-manager/managePackage.sh yarn
}
npm(){
  bash $HOME/know-your-package-manager/managePackage.sh npm
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
  know-your-package-manager
}
npm(){
  know-your-package-manager
}
```

## Future implementation ... global nodemodule:
Simular to homebrew install experience.


### get details about the environment of the repo/nonrepo you are on by running verify.sh in the project.
