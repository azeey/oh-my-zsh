if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '♐' && return
    echo '$'
}
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# the svn plugin has to be activated for this to work.
#local blue_op="%{$fg[blue]%}[%{$reset_color%}"
#local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
#local path_p="${blue_op}%~${blue_cp}"
#local user_host="${blue_op}%n@%m${blue_cp}"
#local ret_status="${blue_op}%?${blue_cp}"
#local hist_no="${blue_op}%h${blue_cp}"
#local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"


#PROMPT="╭─${path_p}─${user_host}─${ret_status}─${hist_no}
#╰─${blue_op}${smiley}${blue_cp} %# "
#local cur_cmd="${blue_op}%_${blue_cp}"
#PROMPT2="${cur_cmd}> "
#RPS1="%{$(echotc UP 1)%}[some more]%{($echotc DO 1)%}"
RPROMPT='%{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}'

local current_time='%D %T'

#PROMPT='%{$fg_bold[green]%}%n@%m %{$current_time%}%{$fg_bold[red]%} ➜ %{$fg[white]%}%3~ $(prompt_char) %{$reset_color%}'
#PROMPT='%{$fg[green]%}[%n@%m %{$fg[yellow]%}%D %T%{$fg[green]%}]: %{$fg[white]%}%3~ %{$fg_bold[$NCOLOR]%}$(prompt_char) %{$reset_color%}'
PROMPT='%{$fg[yellow]%}[%D %T]%{$fg[green]%}[%n@%m]%}%{$fg[white]%} ${PWD/#$HOME/~}
%{$fg[$NCOLOR]%}%{$(prompt_char)%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "



ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" "

