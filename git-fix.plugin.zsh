0="${${ZERO:-${0:#$ZSH_NAME}}:-${(%):-%N}}"
typeset -g GIT_FIX_DIR="${0:A:h}"

path+=("$GIT_FIX_DIR/bin")

_git_fix_complete() {
  local -a commits
  commits=(${(f)"$(git log --format='%h:%s' -30 2>/dev/null)"})
  _describe -t commits 'commit' commits
}
compdef _git_fix_complete git-fix 2>/dev/null
