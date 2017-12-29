Dotfiles
========

This is my collection of dotfiles, managed by [homeshick](https://github.com/andsens/homeshick).

Quickstart
----------

Assumes bash, git, and neofetch are available and installed.

Install Homeshick:

    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

Make *homeshick* command available:

    source "$HOME/.homesick/repos/homeshick/homeshick.sh"

On termux, fix shebang ((explation)[https://wiki.termux.com/wiki/Differences_from_Linux]):

    cd "$HOME/.homesick/repos/homeshick/bin"
    termux-fix-shebang homeshick

Install *castles*:

    homeshick clone https://github.com/MinchinWeb/dotfiles.git
    homeshick clone https://github.com/nojhan/liquidprompt.git
    homeshick clone https://github.com/mrzool/bash-sensible.git

Install machine-specific *castle* (pick one) (these all provide `.local.bashrc` and so will overwrite each other):

    homeshick clone https://github.com/MinchinWeb/dotfiles-honfleur.git
    homeshick clone https://github.com/MinchinWeb/dotfiles-ellesmereilsand.git
    homeshick clone https://github.com/MinchinWeb/dotfiles-termux.git

Link up everything (if this doesn't happen automatically on installation):

    homeshick link -v

Reload *.bashrc*:

    source ~/.bashrc

Profit!
