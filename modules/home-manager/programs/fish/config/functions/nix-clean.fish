function nix-clean --argument-names days --description "Performs nix garbage collection"
    test -n "$days"; or set days 7

    echo "Deleting all generations older than $days days"
    sudo nix-collect-garbage --delete-older-than {$days}d
    nix-collect-garbage --delete-older-than {$days}d
end
