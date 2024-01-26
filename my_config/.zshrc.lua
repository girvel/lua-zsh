--[[

OLD CONFIG:

#!/usr/bin/env zsh

# CROSS-PLATFORM SHIT #
if [ -n "$WSL_DISTRO_NAME" ]; then
    alias g="git.exe"
    alias c='cargo.exe'
    alias cdw="cd /mnt/d/workshop"
else
    alias g="git"
    alias c="cargo"
    alias cdw='cd $HOME/workshop'
fi

# BASE #
alias A='sudo aptitude'
alias e='$EDITOR'
alias E='sudo $EDITOR'
alias l='ls -lah --group-directories-first'
alias td='todoist'

# EDITOR #
git config --global core.editor "$EDITOR"
alias erc='e ~/.zshrc; source ~/.zshrc'
alias rc='source ~/.zshrc'
function ebin() {
    e ~/.local/bin/"$1"
    chmod +x ~/.local/bin/"$1"
}

# GIT #
alias gac='g add `g rev-parse --show-toplevel` && git commit'
alias gacp='gac && g push'
alias gst='g status'
alias gd='g diff'
alias glog='g log --oneline --graph'
alias gpull='g pull'

]]

zsh.pull_config("https://github.com/girvel/arch-theme.git")

if zsh.env.WSL_DISTRO_NAME == "" then
  zsh.aliases.g = {"git.exe"}
  -- ...
else
  zsh.aliases.g = {"git"}
end

zsh.aliases.A = {"sudo", "aptitude"}

-- ...

zsh.call { "git", "config", "--global", "core.editor", zsh.env.EDITOR }

-- TODO figure out how to do this
zsh.functions.ebin = function(args)
  local path = ".local/bin" .. args[1]
  zsh.call {"e", path}
  zsh.call {"chmod", "+x", path}
end
