PS1='\[\e[0;2m\]\u\[\e[0;2m\]@\[\e[0;2m\]\H\[\e[0;2m\]: \[\e[0;1m\]\w \[\e[0;3m\]\n\[\e[0;2m\]❯ \[\e[0m\]'

bind "set completion-ignore-case on"

set -o vi

EDITOR=nvim

alias a="git add -A ; git commit"
alias aa="git add -A ; git commit -m 'auto commit'"
alias p="git push"
alias pp="git push -f"
alias s="git status -sb"
alias ...="cd .. ; cd .. ; ls"
alias ..="cd .. ; ls"
alias ll="ls -al"
alias l="ll"
alias la="ls -a"
alias q="exit"
alias v="nvim"
alias dow="cd ~/Downloads"
alias doc="cd ~/Documents"
alias vid="cd ~/Videos"
alias pic="cd ~/Pictures"

function reload() {
    cp ~/repos/ongedit/dotfiles/.bashrc ~/
    source ~/.bashrc
    cp ~/repos/ongedit/dotfiles/.gitconfig ~/
}

function cdr() {
    cd $(git rev-parse --show-toplevel)
}

function change_dir_fzf() {
    cd $(fd --type directory --exclude scoop --exclude go --exclude .vscode --exclude bundle --exclude .git --exclude gems --exclude node_modules | fzf --height 50% --min-height 20 --reverse)
}
alias c="change_dir_fzf"

function cc() {
    cd
    change_dir_fzf
}

function edit_file_fzf() {
    nvim $(fd --hidden --type file . | fzf --height 50% --min-height 20 --reverse)
}
alias e="edit_file_fzf"

function download_youtube_audio() {
    yt-dlp --extract-audio --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" "$1"
}
alias da="download_youtube_audio"

function download_youtube_video() {
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -o "%(title)s.%(ext)s" "$1"
}
alias dv="download_youtube_video" 

function sync_music() {
  CURRENT_DIR=$(pwd)

  cd $HOME/Music/

  yt-dlp --download-archive archive.txt --extract-audio --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" "ongedit.github.io/music"

  cd $CURRENT_DIR
}
