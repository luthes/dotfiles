import git
from git import Repo
import os
import subprocess
import sys

# This will install required packages through the package manager, clone
# dotfiles repos, as well as those required for Vim plugins.
# 
#   luthes/dotifles ~/.dotfiles
#       Symlink the following:
#            vimrc to ~/.vimrc
#            tmux.conf ~/.tmux.conf
#            vim ~/.vim
#   VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#   xolox/vim-misc - This is in the dot files vim directory 
#   xolox/vim-notes - This is in the dot files vim directory

#-----------Helper Functions to check OS and install packages
def decode_utf8(string):
    return string.decode("utf-8")


def check_package(package):
    try:
        command = "which " + package
        process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        package_returned, error = process.communicate()
        package_returned = decode_utf8(package_returned[:-1])
    except AttributeError:
        # This happens when there is no error returned from subprocess
        pass

    return package_returned


def install_package(package_manager, package):
    command = package_manager + " install " + package + " -y"
    process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    return
    

def check_packages():
    os = ''
    package_manager = ''
    
    # Check OS
    if sys.platform == "linux" or sys.platform == "linux2":
        os = "linux"
    if sys.platform == "darwin": 
        os = "darwin"

    # Mac
    # Check for Brew
    if os == "darwin":
        command = "which brew"
        print("MacOS detected")
        process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        print(output)

    #Linux
    #Check for apt/yum
    if os == "linux" or os == "linux2":
        apt_package = check_package("apt")
        git_package = check_package("git")
        vim_package = check_package("vim")
        
        if apt_package is "":
            print("Package manager not Found")
            return

        if git_package is "":
            print("Git not found, installing now.")
            install_package(apt_package, "git")

        if vim_package is "":
            print("Vim not found, installing now.")
            install_package(apt_package, "vim")

    return package_manager


# -------------- Retrieve and install dotfiles, vim plugins
def clone_repos(home_dir):
    try:
       print("Creating Dotfiles Repo")
       git.Repo.clone_from("https://github.com/luthes/dotfiles",\
               home_dir + "/.dotfiles/")
       print("Creating Dotfiles Repo - " + home_dir + "/.dotfiles/")
    except git.GitCommandError as exc:
        print("Dotfiles repo already exists, skipping...")
        pass
    
    try:
        print("Creating Vundle Repo")
        Repo.clone_from("https://github.com/VundleVim/Vundle.vim.git",\
                home_dir + "/.vim/bundle/Vundle.vim")
        print("Creating Vundle Repo - " + home_dir + "/.vim/bundle/Vundle.vim")
    except git.GitCommandError as exc:
        print("Vundle repo already exists, skipping...")
        pass
    

def create_symlinks(home_dir):
    try:
        print("Creating vimrc symlink - " + home_dir + "/.vimrc")
        os.symlink(home_dir + "/.dotfiles/vimrc", home_dir + "/.vimrc")
        print("Creating Dotfiles Repo")
    except FileExistsError:
        print("Symlink for vimrc already exists, skipping...")
        pass
        
    try:
        print("Creating tmux symlink - " + home_dir + "/.tmux.conf")
        os.symlink(home_dir + "/.dotfiles/tmux.conf", home_dir + "/.tmux.conf")
        print("Creating Dotfiles Repo")
    except FileExistsError:
        print("Symlink for tmux.conf already exists, skipping...")
        pass


def install_vim_plugins(home_dir):
    # Run Vim command to install plugins
    print("Running Vim command to install Vim plugins, " + command)
    process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()


def main():
    #Expand Home Directory
    home_dir = os.path.expanduser('~')
    command = "vim +PluginInstall +qall"
    check_packages()
    clone_repos(home_dir)


if __name__ == '__main__':
    main()
        
