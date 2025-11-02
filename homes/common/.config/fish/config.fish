status is-login; and begin
    # Login shell initialisation
end

status is-interactive; and begin
    # Abbreviations
    abbr --add -- bash /run/current-system/sw/bin/bash
    abbr --add -- compress tar czf \"tar_name.tar.gz\" \<files\>
    abbr --add -- extract tar xzf \"targz_file\"

    # Aliases
    alias cat bat
    alias di dev-session
    alias dotfiles 'tmuxp load -y dotfiles'
    alias gi gitui
    alias la 'eza -a'
    alias lf yazi
    alias lla 'eza -la'
    alias ll 'eza -l'
    alias ls eza
    alias lt 'eza --tree'
    alias notes 'tmuxp load -y notes'
    alias tree 'eza --tree'
    alias vim nvim
    alias vi nvim

    # Interactive shell initialisation
    fzf --fish | source

    set fish_greeting

    # For tmux
    set -gx SHELL /run/current-system/sw/bin/fish

    fish_vi_key_bindings
    set fish_vi_force_cursor
    set fish_cursor_default block
    set fish_cursor_insert line

    # The superior note taking system
    bind \cn 'nvim $HOME/notes.txt'

    batman --export-env | source

    zoxide init fish | source

    direnv hook fish | source
end
