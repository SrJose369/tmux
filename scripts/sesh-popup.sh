#!/usr/bin/env bash

/home/jose/go/bin/sesh connect "$(
  /home/jose/go/bin/sesh list --icons | /usr/bin/fzf-tmux -p 80%,70% \
    --no-sort --ansi --border-label ' /home/jose/go/bin/sesh ' --prompt '⚡  ' \
    --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(⚡  )+reload(/home/jose/go/bin/sesh list --icons)' \
    --bind 'ctrl-t:change-prompt(🪟  )+reload(/home/jose/go/bin/sesh list -t --icons)' \
    --bind 'ctrl-g:change-prompt(⚙️  )+reload(/home/jose/go/bin/sesh list -c --icons)' \
    --bind 'ctrl-x:change-prompt(📁  )+reload(/home/jose/go/bin/sesh list -z --icons)' \
    --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(/home/jose/go/bin/sesh list --icons)' \
    --preview-window 'right:55%' \
    --preview '/home/jose/go/bin/sesh preview {}'
)"
