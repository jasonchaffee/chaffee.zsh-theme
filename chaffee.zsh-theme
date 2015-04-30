# chaffee.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%(?.%{$fg[green]%}⏎.%{$fg[red]%}⏎)%{$reset_color%}"

  JAVA_PROMPT="%{$fg[yellow]%}jvm%{$reset_color%}:%{$fg[magenta]%}% $(java -version 2>&1 | grep 'java version' | awk '{print $3}' | tr -d \" | tr -d 'java version')"

  PROMPT='%(?.%{$reset_color%}⏎.%{$fg[red]%}⏎)%{$reset_color%} ${JAVA_PROMPT} %{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}λ)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status)%{$reset_color%} %F{green}%D{%L:%M:%S} %F{yellow}%D{%p}%f'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else 
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"
  
  PROMPT='%(?.%{$fg[green]%}⏎.%{$fg[red]%}⏎)%{$reset_color%} %c$(git_prompt_info) %(!.#.λ) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status) %F{green}%D{%L:%M:%S} %F{yellow}%D{%p}%f'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
