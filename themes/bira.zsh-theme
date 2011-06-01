# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

function heroku_cloud {
  if [[ ${HEROKU_HOST} == '' ]]; then
    echo -n "prod"
  else
    prompt_str=`echo ${HEROKU_HOST} | sed s/\.herokudev\.com$//`
    echo -n $prompt_str
  fi
}
local heroku_cloud='%{$terminfo[bold]$fg[blue]%}$([ -n "$(heroku_cloud)" ] && echo -n "‹$(heroku_cloud)›")%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}${heroku_cloud}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
