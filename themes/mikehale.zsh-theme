ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_char="↪"
local return_prompt="%(?:%{$fg_bold[green]%}${return_char}%?%{$reset_color%}:%{$fg_bold[red]%}${return_char}%?%{$reset_color%})"
local host_prompt="%{$fg[cyan]%}%n@%m%{$reset_color%}"
local time_prompt="%{$fg[blue]%}%D{%I:%M:%S}%{$reset_color%}"
local pwd_prompt="%{$fg[yellow]%}%~%{$reset_color%}"
local prompt_prefix="%{$fg[blue]%}$%{$reset_color%}"

function heroku_prompt() {
  if [ "$cloud" = "prod" ]; then
      echo "%{$fg_bold[magenta]%}☁${HEROKU_CLOUD}%{$reset_color%}"
  else
      echo "%{$fg_bold[blue]%}☁${HEROKU_CLOUD}%{$reset_color%}"
  fi
}

function my_git_prompt_info() {
  local git_prompt_info="$(git_prompt_info)"
  if [[ "${git_prompt_info}" == '' ]]; then
      echo " "
  else
      echo " ${git_prompt_info} "
  fi
}

function ruby_prompt() {
  echo "%{$fg[red]%}$(rbenv_prompt_info)%{$reset_color%}"
}

PROMPT=$'[${return_prompt}] [${host_prompt}] [${time_prompt}] [${pwd_prompt}]$(my_git_prompt_info)[$(ruby_prompt)] [$(heroku_prompt)]\
${prompt_prefix} '
