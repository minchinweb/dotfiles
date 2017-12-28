Dotfiles
========

This is my collection of dotfiles, managed by [homeshick](https://github.com/andsens/homeshick)

Quickstart
----------

Install Homeshick:

    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

Make *homeshick* command available:

    source "$HOME/.homesick/repos/homeshick/homeshick.sh"

Install *castles*:

    homeshick clone https://github.com/MinchinWeb/dotfiles.git
    homeshick clone https://github.com/nojhan/liquidprompt.git
    homeshick clone https://github.com/mrzool/bash-sensible.git

Link up everything:

    homeshick link -v

Reload *.bashrc*:

    source ~/.bashrc

Profit!
