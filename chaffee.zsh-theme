# chaffee.zsh-theme

# Currently used symbols:
# ⚡ ⏎ ✘ λ ✚ ✹ ✖ ➜ ═ ✭

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
#  ±  ➦ ✘ ⚡ ⚙

function java_prompt_info() {
  echo "$JAVA_PROMPT_PREFIX $(java -version 2>&1 | grep 'java version' | awk '{print $3}' | tr -d \" | tr -d 'java version')"
}

function return_prompt_color() {
  echo "%(?.%{$reset_color%}.%{$fg_bold[red]%})"
}

function return_prompt_info() {
  echo "%(?.⏎.✘)"
}

function user_prompt_color() {
  echo "%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})"
}

function user_prompt_info() {
  echo "%(!.⚡ λ.λ)"
}

function time_prompt_info() {
  echo "%D{%L:%M:%S}"
}

function time_period_prompt_info() {
  echo "%D{%p}"
}

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  HOST_PROMPT_="%{$fg_bold[red]%}@$HOST[0,10] ➜ %{$reset_color%}"

  PROMPT='$(return_prompt_color)$(return_prompt_info)%{$reset_color%} $(java_prompt_info) %{$fg[cyan]%}%3~ $(git_prompt_info) $(user_prompt_color)$(user_prompt_info)%{$reset_color%} '

  if command -v javac >/dev/null 2>&1; then
    JAVA_PROMPT_PREFIX="%{$fg[yellow]%}jdk%{$reset_color%}:%{$fg[magenta]%}%"
  else
    JAVA_PROMPT_PREFIX="%{$fg[yellow]%}jre%{$reset_color%}:%{$fg[magenta]%}%"
  fi

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}git%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status)%{$reset_color%} %F{green}$(time_prompt_info) %F{yellow}$(time_period_prompt_info)%f'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
  $HOST_PROMPT_="@$HOST[0,10] ➜ "

  PROMPT='$(return_prompt_info) $(java_prompt_info) %3~ $(git_prompt_info) $(user_prompt_info) '

  JAVA_PROMPT_PREFIX=""
  ZSH_THEME_GIT_PROMPT_PREFIX="git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status) $(time_prompt_info) $(time_period_prompt_info)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
