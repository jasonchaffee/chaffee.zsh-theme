# chaffee.zsh-theme

# Currently used symbols:
# ⚡ ⏎ ✘ λ ✚ ✹ ✖ ➜ ═ ✭

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
#  ±  ➦ ✘ ⚡ ⚙

function java_prompt_prefix() {
  if command -v javac >/dev/null 2>&1; then
    echo "jdk"
  elif command -v java >/dev/null 2>&1; then
    echo "jre"
  fi
}

function java_prompt_info() {
  if command -v java >/dev/null 2>&1; then
    echo "$ZSH_THEME_JAVA_PROMPT_PREFIX$(java -version 2>&1 | grep 'java version' | awk '{print $3}' | tr -d \")$ZSH_THEME_JAVA_PROMPT_SUFFIX"
  fi
}

function go_prompt_info() {
  if command -v go >/dev/null 2>&1; then
    echo "$ZSH_THEME_GO_PROMPT_PREFIX$(go version 2>&1 | grep 'go version' | awk '{print $3}' | tr -d \")$ZSH_THEME_GO_PROMPT_SUFFIX"
  fi
}

function node_prompt_info() {
  if command -v node >/dev/null 2>&1; then
    if node --version >/dev/null 2>&1; then
      echo "$ZSH_THEME_NODE_PROMPT_PREFIX$(node --version)$ZSH_THEME_NODE_PROMPT_SUFFIX"
    fi
  fi
}

function python_prompt_info() {
  if command -v python >/dev/null 2>&1; then
    echo "$ZSH_THEME_PYTHON_PROMPT_PREFIX$(python --version 2>&1 | grep 'Python' | awk '{print $2}' | tr -d \")$ZSH_THEME_PYTHON_PROMPT_SUFFIX"
  fi
}

function ruby_prompt_info() {
  if command -v ruby >/dev/null 2>&1; then
    echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$(ruby --version 2>&1 | grep 'ruby' | awk '{print $2}' | tr -d \")$ZSH_THEME_RUBY_PROMPT_SUFFIX"
  fi
}

function scala_prompt_info() {
  if command -v scala >/dev/null 2>&1; then
    echo "$ZSH_THEME_SCALA_PROMPT_PREFIX$(scala -version 2>&1 | grep 'Scala code runner version' | awk '{print $5}' | tr -d \")$ZSH_THEME_SCALA_PROMPT_SUFFIX"
  fi
}

function return_prompt_info() {
  echo "%(?.$ZSH_THEME_RETURN_PROMPT_SUCCESS_PREFIX$ZSH_THEME_RETURN_PROMPT_SUCCESS$ZSH_THEME_RETURN_PROMPT_SUCCESS_SUFFIX.$ZSH_THEME_RETURN_PROMPT_ERROR_PREFIX$ZSH_THEME_RETURN_PROMPT_ERROR$ZSH_THEME_RETURN_PROMPT_ERROR_SUFFIX)"
}

function user_privilege_prompt_info() {
  echo "%(!.$ZSH_THEME_USER_PROMPT_SUPER_PREFIX$ZSH_THEME_USER_PROMPT_SUPER$ZSH_THEME_USER_PROMPT_SUPER_SUFFIX.$ZSH_THEME_USER_PROMPT_NONSUPER_PREFIX$ZSH_THEME_USER_PROMPT_NONSUPER$ZSH_THEME_USER_PROMPT_NONSUPER_SUFFIX)"
}

function time_prompt_info() {
  echo "$ZSH_THEME_TIME_PROMPT_PREFIX%D{%L:%M:%S}$ZSH_THEME_TIME_PROMPT_SUFFIX"
}

function time_period_prompt_info() {
  echo "$ZSH_THEME_TIME_PERIOD_PROMPT_PREFIX%D{%p}$ZSH_THEME_TIME_PERIOD_PROMPT_SUFFIX"
}

function pwd_prompt_info() {
  echo "$ZSH_THEME_PWD_PROMPT_PREFIX$ZSH_THEME_PWD_PROMPT$ZSH_THEME_PWD_PROMPT_SUFFIX"
}

fuction user_prompt_info() {
  echo "$ZSH_THEME_USER_PROMPT_PREFIX$ZSH_THEME_USER_PROMPT$ZSH_THEME_USER_PROMPT_SUFFIX"
}

function host_prompt_info() {
  echo "$ZSH_THEME_HOST_PROMPT_PREFIX$ZSH_THEME_HOST_PROMPT$ZSH_THEME_HOST_PROMPT_SUFFIX"
}

function one_line_prompt() {
  echo '$(return_prompt_info)$(java_prompt_info)$(scala_prompt_info)$(go_prompt_info)$(node_prompt_info)$(python_prompt_info)$(ruby_prompt_info)$(pwd_prompt_info)$(git_prompt_info)$(svn_prompt_info)$(user_privilege_prompt_info)'
}

function two_line_prompt() {
  echo '$(user_prompt_info)$(host_prompt_info)$(pwd_prompt_info)$(git_prompt_info)$(svn_prompt_info)
$(return_prompt_info)$(java_prompt_info)$(scala_prompt_info)$(go_prompt_info)$(node_prompt_info)$(python_prompt_info)$(ruby_prompt_info)$(user_privilege_prompt_info)'
}

function prompt_set() {
  if [[ $1 == 2 ]]; then
    PROMPT=$(two_line_prompt)
  else
    PROMPT=$(one_line_prompt)
  fi
}

PROMPT=$(one_line_prompt)

RPROMPT='$(git_prompt_status)$(svn_dirty)$(svn_dirty_pwd)$(time_prompt_info)$(time_period_prompt_info)'

GIT_PROMPT_PREFIX=git
SVN_PROMPT_PREFIX=svn

GO_PROMPT_PREFIX=go
NODE_PROMPT_PREFIX=node
PYTHON_PROMPT_PREFIX=py
RUBY_PROMPT_PREFIX=rb
SCALA_PROMPT_PREFIX=scala

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  ZSH_THEME_USER_PROMPT_PREFIX="%{$fg[yellow]%}"
  ZSH_THEME_USER_PROMPT="%n"
  ZSH_THEME_USER_PROMPT_SUFFIX="%{$reset_color%}@"

  ZSH_THEME_HOST_PROMPT_PREFIX="%{$fg[magenta]%}"
  ZSH_THEME_HOST_PROMPT="%m"
  ZSH_THEME_HOST_PROMPT_SUFFIX="%{$reset_color%} ➜ %{$reset_color%}"

  ZSH_THEME_PWD_PROMPT_PREFIX=" %{$fg[cyan]%}"
  ZSH_THEME_PWD_PROMPT="%10~"
  ZSH_THEME_PWD_PROMPT_SUFFIX="%{$reset_color%}"

  ZSH_THEME_RETURN_PROMPT_SUCCESS_PREFIX="%{$reset_color%}"
  ZSH_THEME_RETURN_PROMPT_SUCCESS="⏎"
  ZSH_THEME_RETURN_PROMPT_SUCCESS_SUFFIX="%{$reset_color%}"

  ZSH_THEME_RETURN_PROMPT_ERROR_PREFIX="%{$fg_bold[red]%}"
  ZSH_THEME_RETURN_PROMPT_ERROR="✘"
  ZSH_THEME_RETURN_PROMPT_ERROR_SUFFIX="%{$reset_color%}"

  if command -v java >/dev/null 2>&1; then
    ZSH_THEME_JAVA_PROMPT_PREFIX=" [%{$fg[yellow]%}$(java_prompt_prefix)%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_JAVA_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_JAVA_PROMPT_PREFIX='"
    ZSH_THEME_JAVA_PROMPT_SUFFIX=""
  fi

  if command -v go >/dev/null 2>&1; then
    ZSH_THEME_GO_PROMPT_PREFIX=" [%{$fg[yellow]%}$GO_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_GO_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_GO_PROMPT_PREFIX=""
    ZSH_THEME_GO_PROMPT_SUFFIX=""
  fi

  if command -v node >/dev/null 2>&1; then
    ZSH_THEME_NODE_PROMPT_PREFIX=" [%{$fg[yellow]%}$NODE_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_NODE_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_NODE_PROMPT_PREFIX=""
    ZSH_THEME_NODE_PROMPT_SUFFIX=""
  fi

  if command -v python >/dev/null 2>&1; then
    ZSH_THEME_PYTHON_PROMPT_PREFIX=" [%{$fg[yellow]%}$PYTHON_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_PYTHON_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_PYTHON_PROMPT_PREFIX=""
    ZSH_THEME_PYTHON_PROMPT_SUFFIX=""
  fi

  if command -v ruby >/dev/null 2>&1; then
    ZSH_THEME_RUBY_PROMPT_PREFIX=" [%{$fg[yellow]%}$RUBY_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_RUBY_PROMPT_PREFIX=""
    ZSH_THEME_RUBY_PROMPT_SUFFIX=""
  fi

  if command -v scala >/dev/null 2>&1; then
    ZSH_THEME_SCALA_PROMPT_PREFIX=" [%{$fg[yellow]%}$SCALA_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}% "
    ZSH_THEME_SCALA_PROMPT_SUFFIX="%{$reset_color%}]"
  else
    ZSH_THEME_SCALA_PROMPT_PREFIX=""
    ZSH_THEME_SCALA_PROMPT_SUFFIX=""
  fi

  ZSH_THEME_USER_PROMPT_SUPER_PREFIX=" %{$fg_bold[red]%}"
  ZSH_THEME_USER_PROMPT_SUPER="⚡ λ"
  ZSH_THEME_USER_PROMPT_SUPER_SUFFIX=" %{$reset_color%}"

  ZSH_THEME_USER_PROMPT_NONSUPER_PREFIX=" %{$fg_bold[green]%}"
  ZSH_THEME_USER_PROMPT_NONSUPER="λ"
  ZSH_THEME_USER_PROMPT_NONSUPER_SUFFIX=" %{$reset_color%}"

  ZSH_THEME_TIME_PROMPT_PREFIX=" %{$fg[green]%}"
  ZSH_THEME_TIME_PROMPT_SUFFIX="%{$reset_color%}"

  ZSH_THEME_TIME_PERIOD_PROMPT_PREFIX=" %{$fg[yellow]%}"
  ZSH_THEME_TIME_PERIOD_PROMPT_SUFFIX="%{$reset_color%}"

  SVN_SHOW_BRANCH="true"
  ZSH_PROMPT_BASE_COLOR="%{$fg[yellow]%}"
  ZSH_THEME_SVN_PROMPT_PREFIX=" $SVN_PROMPT_PREFIX%{$reset_color%}:"
  ZSH_THEME_REPO_NAME_COLOR="%{$fg[magenta]%}"
  ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[blue]%} ✹"
  ZSH_THEME_SVN_PROMPT_CLEAN=""
  ZSH_THEME_SVN_PROMPT_DIRTY_PWD="%{$fg[blue]%} ✭"
  ZSH_THEME_SVN_PROMPT_CLEAN_PWD=""

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}$GIT_PROMPT_PREFIX%{$reset_color%}:%{$fg[magenta]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
  ZSH_THEME_USER_PROMPT_PREFIX=""
  ZSH_THEME_USER_PROMPT="%n"
  ZSH_THEME_USER_PROMPT_SUFFIX="@"

  ZSH_THEME_HOST_PROMPT_PREFIX=""
  ZSH_THEME_HOST_PROMPT="%m"
  ZSH_THEME_HOST_PROMPT_SUFFIX=" ➜ "

  ZSH_THEME_PWD_PROMPT_PREFIX=" "
  ZSH_THEME_PWD_PROMPT="%10~"
  ZSH_THEME_PWD_PROMPT_SUFFIX=""

  ZSH_THEME_RETURN_PROMPT_SUCCESS_PREFIX=""
  ZSH_THEME_RETURN_PROMPT_SUCCESS="⏎"
  ZSH_THEME_RETURN_PROMPT_SUCCESS_SUFFIX=""

  ZSH_THEME_RETURN_PROMPT_ERROR_PREFIX=""
  ZSH_THEME_RETURN_PROMPT_ERROR="✘"
  ZSH_THEME_RETURN_PROMPT_ERROR_SUFFIX=""

  if command -v java >/dev/null 2>&1; then
    ZSH_THEME_JAVA_PROMPT_PREFIX=" [$(java_prompt_prefix):"
    ZSH_THEME_JAVA_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_JAVA_PROMPT_PREFIX=" "
    ZSH_THEME_JAVA_PROMPT_SUFFIX=""
  fi

  if command -v GO >/dev/null 2>&1; then
    ZSH_THEME_GO_PROMPT_PREFIX=" [$GO_PROMPT_PREFIX:"
    ZSH_THEME_GO_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_GO_PROMPT_PREFIX=" "
    ZSH_THEME_GO_PROMPT_SUFFIX=""
  fi

  if command -v node >/dev/null 2>&1; then
    ZSH_THEME_NODE_PROMPT_PREFIX=" [$NODE_PROMPT_PREFIX:"
    ZSH_THEME_NODE_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_NODE_PROMPT_PREFIX=" "
    ZSH_THEME_NODE_PROMPT_SUFFIX=""
  fi

  if command -v python >/dev/null 2>&1; then
    ZSH_THEME_PYTHON_PROMPT_PREFIX=" [$PYTHON_PROMPT_PREFIX:"
    ZSH_THEME_PYTHON_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_PYTHON_PROMPT_PREFIX=" "
    ZSH_THEME_PYTHON_PROMPT_SUFFIX=""
  fi

  if command -v ruby >/dev/null 2>&1; then
    ZSH_THEME_RUBY_PROMPT_PREFIX=" [$RUBY_PROMPT_PREFIX:"
    ZSH_THEME_RUBY_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_RUBY_PROMPT_PREFIX=" "
    ZSH_THEME_RUBY_PROMPT_SUFFIX=""
  fi

  if command -v scala >/dev/null 2>&1; then
    ZSH_THEME_SCALA_PROMPT_PREFIX=" [$SCALA_PROMPT_PREFIX:"
    ZSH_THEME_SCALA_PROMPT_SUFFIX="]"
  else
    ZSH_THEME_SCALA_PROMPT_PREFIX=" "
    ZSH_THEME_SCALA_PROMPT_SUFFIX=""
  fi

  ZSH_THEME_USER_PROMPT_SUPER_PREFIX=" "
  ZSH_THEME_USER_PROMPT_SUPER="⚡ λ"
  ZSH_THEME_USER_PROMPT_SUPER_SUFFIX=" "

  ZSH_THEME_USER_PROMPT_NONSUPER_PREFIX=" "
  ZSH_THEME_USER_PROMPT_NONSUPER="λ"
  ZSH_THEME_USER_PROMPT_NONSUPER_SUFFIX=" "

  ZSH_THEME_TIME_PROMPT_PREFIX=" "
  ZSH_THEME_TIME_PROMPT_SUFFIX=""

  ZSH_THEME_TIME_PERIOD_PROMPT_PREFIX=" "
  ZSH_THEME_TIME_PERIOD_PROMPT_SUFFIX=""

  SVN_SHOW_BRANCH="true"
  ZSH_PROMPT_BASE_COLOR=""
  ZSH_THEME_SVN_PROMPT_PREFIX=" $SVN_PROMPT_PREFIX:"
  ZSH_THEME_REPO_NAME_COLOR=""
  ZSH_THEME_SVN_PROMPT_DIRTY=" ✹"
  ZSH_THEME_SVN_PROMPT_CLEAN=""
  ZSH_THEME_SVN_PROMPT_DIRTY_PWD=" ✭"
  ZSH_THEME_SVN_PROMPT_CLEAN_PWD=""

  ZSH_THEME_GIT_PROMPT_PREFIX=" $GIT_PROMPT_PREFIX:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
