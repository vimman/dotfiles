#!/usr/bin/env bash

# Check if homebrew is installed and install it if is not
which -s brew
if [[ $? != 0 ]]
then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
fi

# Check if brew cask is installed and install it if is not
if ! brew info brew-cask &>/dev/null; then
	brew tap caskroom/cask
	brew install caskroom/cask/brew-cask
	brew install brew-cask-completion
else
	:
fi

# Upgrade existing formulae
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Run this command if is the first time you run the script
export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin:"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install some common tools i use the most
brew install ack
brew install dark-mode
brew install stow
brew install ctags
brew install imagemagick
brew install neovim/neovim/neovim
brew install nmap
brew install sox
brew install youtube-dl
brew install watch
brew install zsh
brew install zsh-completions
brew install htop
brew install tree

# Possible to install but needs more investigations
#brew cask install ableton-live-suite
#brew cask install little-snitch

# Install some gui application

brew cask install cryptomator
brew cask install gimp
brew cask install imageoptim
brew cask install firefoxdeveloperedition
brew cask install appcleaner
brew cask install google-drive
brew cask install iterm2
brew cask install transmission
brew cask install wireshark
brew cask install virtualbox
brew cask install chromium
brew cask install karabiner
brew cask install onyx
brew cask install emacs
brew cask install shiftit
brew cask install vlc

# Clean outdated utils
brew cleanup

# Install shel integration for iterm
curl -L https://iterm2.com/misc/install_shell_integration_and_utilities.sh | bash
