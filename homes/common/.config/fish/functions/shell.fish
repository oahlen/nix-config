function shell --argument-names name --description "Enters the dev shell of the given name"
    if not test -n "$DOTFILES"
        echo "\$DOTFILES variable must be set"
        return
    end

    if not test -n "$name"
        echo "Shell name must be provided"
        return
    end

    nix-shell "$DOTFILES/shells" -A "$name" --command "$SHELL"
end
