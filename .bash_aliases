# global aliases
alias \
  C='| wc -l' \
  G='| grep ' \
  U='winpty ugrep -Qin --bool -A 4 -B 4 ' \
  Uf='winpty ugrep -QZi --bool -A 4 -B 4 ' \
  L='| less' \
  M='| most' \
  P='2>&1 | $PAGER' \
  LA='2>&1 | less' \
  NE='2>|/dev/null' \
  NO='&>|/dev/null' \
  EO='>|/dev/null' \
  python='~/AppData/Local/Programs/Python/Python39/python.exe'

# config
alias \
  vedit=' $EDITOR $HOME/.vimrc' \
  aedit=' $EDITOR $HOME/.bash_aliases; source $HOME/.bash_aliases' \
  fedit=' $EDITOR $HOME/.bash_functions; source $HOME/.bash_functions' \
  tedit=' $EDITOR $HOME/.config/tmux/.tmux.conf; source $HOME/.config/tmux/tmux.conf > /dev/null 2>&1' \
  tl='tmux ls' \
  ta='tmux attach -d -t ' \
  .c='clear' \
  .e='explorer.exe .' \
  .w='cd ~/work' \
  .f='~/scripts/f'

# general
alias \
  d=' dirs -v' \
  g=' git' \
  p=' ps aux | grep' \
  cp='cp -iv' \
  vi='vim' \
  k9='sudo kill -9' \
  ka='killall' \
  la=' ls -alh' \
  ls=' ls -hlr' \
  mv='mv -iv' \
  rm='rm -iv' \
  tt='du -hsx * | sort -rh | head -10' \
  cd=' cd' \
  ..=' cd ..; ls' \
  ...=' cd ..; cd ..; ls' \
  ....=' cd ..; cd ..; cd ..; ls' \
  cd..='..' \
  cd...='...' \
  cd....='....' \
  mkd='mkdir -pv' \
  diff='diff' \
  less='less -R' \
  grep='grep --color=auto' \
  fgrep='fgrep --color=auto' \
  egrep='egrep --color=auto'

# git aliases

alias \
  gd='git diff' \
  ga='git add' \
  gcbr='git rev-parse --abbrev-ref HEAD' \
  gp='git push `git_origin_or_fork` `gcbr`' \
  gpl='git pull `git_origin_or_fork` `gcbr`' \
  gc='git commit --verbose' \
  gs='git status --short --branch' \
  gsp='git stash pop' \
  gbr='git branch --no-merged origin/master --sort=-committerdate | head -n 10' \
  grc='git rebase --continue' \
  gl='git log --oneline' \
  gco='git checkout' \
  gb='git branch' \
  gg='git grep' \
  ggi='git grep -i' \
  gfo='git fetch origin master' \
  gro='git rebase origin/master' \
  gu='git reset --soft HEAD~1' \
  guh='git reset --hard HEAD~1' \
  gfogro='gfo && gro' \
  gupd='gfogro && gpf' \
  blush='git commit --amend --reuse-message HEAD' \
  squash='git rebase -i $(git merge-base HEAD master)' \
  rebase_latest_green='gfo && git rebase $(ci_last_green_master)' \
  rlg=rebase_latest_green

# Git Diff Files Test
alias \
  gdft='gdf | rg "test/.*_test"' \
  git_diff_commit='git diff-tree --no-commit-id --name-only -r HEAD' \
  gdc=git_diff_commit \
  rlc='review-latest-commit' \
  gsd='git-stash-dir'
