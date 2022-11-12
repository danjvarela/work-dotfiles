# dotfiles

Garbage (that took me quite some time to create) from my programming setup, managed by [yadm](yadm.io). I'm working on a mac so you have to make some adjustments if you want to clone this setup on linux (I don't advise cloning this though. Just read through and find out if some config suits your workflow). This is always a work in progress.

## Installation
### Prerequisites
Before cloning this repo using `yadm clone` make sure to have:

* [Homebrew](https://brew.sh/) installed.
* [yadm](http://localhost:8146/page/yadm.io) installed.
* [oh-my-zsh](https://ohmyz.sh/#install) installed (oh-my-zsh will overwrite the dotfile's .zshrc if we install it after running cloning this repo).

### How to install

#### Case 1: You already have the prerequisites installed
**NOTE**: Review the [bootstrap](https://github.com/danjvarela/dotfiles/blob/master/.config/yadm/bootstrap) script as well as the scripts inside the [`$HOME/.config/yadm/`](https://github.com/danjvarela/dotfiles/tree/master/.config/yadm) directory before running 
```
yadm clone https://github.com/danjvarela/dotfiles.git
```
as it may have unintended results.

#### Case 2: You don't have the prerequisites installed
Run
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/danjvarela/dotfiles/master/.config/yadm/install.sh)"
```
This will install the prerequisites for you. You can then run
```
yadm clone https://github.com/danjvarela/dotfiles.git
```
to clone this repo. Again, please review the scripts first since I've only tested those on my machine and they might overwrite some of your configs or have some other unintended results.
