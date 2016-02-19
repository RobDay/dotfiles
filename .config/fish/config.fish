set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
. ~/.config/virtual.fish


# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch yellow

# function fish_right_prompt
#     echo -n (__fish_git_prompt)
# end


function fish_prompt
    ~/.powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
end

source ~/.config/fish/z.fish

set -g -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
source ~/.config/fish/nvm-wrapper/nvm.fish
nvm use default
