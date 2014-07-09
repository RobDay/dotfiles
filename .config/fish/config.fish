# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
. ~/.config/virtual.fish


. $fish_path/oh-my-fish.fish


set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

function fish_right_prompt
    echo -n (__fish_git_prompt)
end

set -g -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
