#git-remote-plus

## Install

* Copy the files of `this` folder to `$HOME/tools/git-scripts` folder.
* open the .zshrc file with `sudo nano ~/.zshrc`  and add the below lines.

    ```shell
    # git-scripts
    PATH=$HOME/tools/git-scripts:$PATH
    ```
* reload the `.zshrc` file with the `source ~/.zshrc` command.


## Usage

* `git remote-save` : save the remotes in .gitremotes file.
* `git remote-init` : init the remotes from .gitremotes file
* `git-quick-stats` : access various statistics in a git repository
