ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_prompt="%(?:%{$fg_bold[green]%}↑%?%{$reset_color%}:%{$fg_bold[red]%}↑%?%{$reset_color%})"
local ruby_prompt="%{$fg[red]%}$(rbenv_prompt_info)%{$reset_color%}"
local host_prompt="%{$fg_bold[magenta]%}%n@%m%{$reset_color%}"
local time_prompt="%{$fg[blue]%}%D{%I:%M:%S}%{$reset_color%}"
local pwd_prompt="%{$fg[white]%}%~%{$reset_color%}"
local prompt_prefix="%{$fg[blue]%}$%{$fg_bold[blue]%}%{$reset_color%}"
local heroku_prompt="${HEROKU_CLOUD}"

function my_git_prompt_info() {
  local git_prompt_info="$(git_prompt_info)"
  if [[ "${git_prompt_info}" == '' ]]; then
      echo " "
  else
      echo " ${git_prompt_info} "
  fi
}

PROMPT=$'[${return_prompt}] [${host_prompt}] [${time_prompt}] [${pwd_prompt}]$(my_git_prompt_info)[${ruby_prompt}] [${heroku_prompt}]\
${prompt_prefix} '
