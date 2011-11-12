# the git,svn, and vi-mode plugins have to be activated for this to work.
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done
# Check if root
if [ $UID -eq 0 ]; then NCOLOR=$PR_RED; else NCOLOR=$PR_WHITE; fi

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    #svn info >/dev/null 2>/dev/null && echo '♐' && return
    echo '$'
}
local return_code="%(?..$PR_RED%? ↵%{$reset_color%})"

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
PR_NO_COLOR="%{$terminfo[sgr0]%}"

RPROMPT='$PR_GREEN%p $PR_BLUE$(git_prompt_info)$return_code$(vi_mode_prompt_info)%{$reset_color%}'

PROMPT='╭─${PR_WHITE}[${PR_YELLOW}%D %T$PR_WHITE][$PR_BLUE%n$PR_WHITE@$PR_GREEN%U%m%u$PR_WHITE]$PR_RED ${PWD/#$HOME/~}
$PR_WHITE╰─$NCOLOR$(prompt_char)%{$reset_color%} '


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

