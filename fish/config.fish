set -xg PATH ~/.dotfiles/bin $PATH
set -xg EDITOR nvim
set -xg BROWSER google-chrome-stable

alias e="$EDITOR"

# FZF settings
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# Keybindings
function fish_user_key_bindings
    bind \ce "$EDITOR (fzf)"
    bind \cd "__fzf_cd_with_hidden"
    bind \ct "__fzf_find_file"
end
eval (python -m virtualfish)
