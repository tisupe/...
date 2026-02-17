# Zellij AutoTab Rename
if status is-interactive
    if type -q zellij
        # Update the zellij tab name with the current process name or pwd.
        function zellij_tab_name_update_pre --on-event fish_preexec
            if set -q ZELLIJ
                set -l cmd_line (string split " " -- $argv)
                set -l process_name $cmd_line[1]
                if test -n "$process_name" -a "$process_name" != "z"
                    command nohup zellij action rename-tab $process_name >/dev/null 2>&1
                end
            end
        end

        function zellij_tab_name_update_post --on-event fish_postexec
            if set -q ZELLIJ
                set -l cmd_line (string split " " -- $argv)
                set -l process_name $cmd_line[1]
                if test "$process_name" = "z"
                    command nohup zellij action rename-tab (prompt_pwd) >/dev/null 2>&1
                end
            end
        end
    end
end

# fzf
if type -q fzf
    fzf --fish | source
end

function f
    set file (fzf)
    if test -n "$file"
        xdg-open $file
    end
end

# Aliases
alias ani-cli 'ani-cli -q Mp4'
alias lavat '.local/lib/lavat -C'
alias ls 'lsd -a'
alias venv='source .venv/bin/activate.fish'
abbr mkdir 'mkdir -p'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias HOME 'cd $HOME'
alias termux-backup 'tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr'
alias termux-restore 'tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions'
alias pst 'termux-clipboard-get'
alias cpy 'termux-clipboard-set'
alias open 'termux-open'