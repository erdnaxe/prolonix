{ config, pkgs, ... }:

{
  # Selected packages
  environment.systemPackages = [
    # Some text editors and IDE
    pkgs.vim
    pkgs.emacs
    pkgs.ed
    pkgs.codeblocks
    pkgs.eclipses.eclipse-java
    pkgs.geany
    pkgs.leafpad
    pkgs.netbeans
    pkgs.jetbrains.pycharm-community
    pkgs.atom
    # non-free license issues :
    # pkgs.vscode-with-extensions
    # pkgs.sublime

    # Some compression/archiver tools
    pkgs.unzip
    pkgs.zip

    # Commandline tools
    pkgs.screen
    pkgs.tmux
    pkgs.git
    pkgs.zsh
    pkgs.grml-zsh-config
    pkgs.htop
    pkgs.tree
    pkgs.wget
    pkgs.rsync

    # Programming language support and libs
    pkgs.boost
    pkgs.gdb
    pkgs.jdk
    pkgs.lua
    pkgs.mono
    pkgs.nodejs
    pkgs.ocaml
    pkgs.php
    pkgs.python3
    pkgs.qtcreator

    # Documentation
    pkgs.zeal

    # Other tools
    pkgs.fpc
    pkgs.gambit
    pkgs.rlwrap
    pkgs.rxvt_unicode
    pkgs.dejavu_fonts
    pkgs.valgrind
    pkgs.reptyr
    pkgs.samba
  ];
}
