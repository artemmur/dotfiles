#!/bin/python


import os


dirs = [
    "~/.vim/colors",
]


links = [
    {
        "src": "~/.dotfiles/.vim/colors/jellybeans.vim",
        "dest": "~/.vim/colors/jellybeans.vim",
    },
    {
        "src": "~/.dotfiles/.vim/colors/jellybeans.vim",
        "dest": "~/.vim/colors/jellybeans.vim",
    },
    {
        "src": "~/.dotfiles/.vim/colors/jellybeans.vim",
        "dest": "~/.dotfiles/.vim/colors/jellybeans.vim",
    },
]


def create_dirs():
    for i in dirs:
        os.system(f'mkdir -p {i}')


def create_symlinks():
    for i in links:
        os.system(f'ln -s {i["src"]} {i["dest"]}')


def install_vundle():
    os.system(
        "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    )
    os.system("vim +PluginInstall +qall")


def set_theme():
    os.system(
        "ln -s ~/.dotfiles/.vim/bundle/vim-airline/autoload/airline/themes/minimalist.vim ~/.vim/bundle/vim-airline/autoload/airline/themes/minimalist.vim"
    )


def setup_you_complete_me():
    os.system("cd ~/.vim/bundle/YouCompleteMe")
    os.system("./install.py --go-completer --clang-completer")
    os.system("cp ~/.dotfiles/.vim/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py")

def setup_vim():
    install_vundle()
    set_theme()
    setup_you_complete_me()


def setup():
    create_dirs()
    create_symlinks()

    setup_vim()


if "__name__" == __main__:
    setup()
