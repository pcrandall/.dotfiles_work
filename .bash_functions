removeASCII(){
    cat $1 | \
    sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" > "$1_clean.txt"
}

phil_dev(){
    docker exec -it --user="pmcran1" pmcran1 /usr/bin/bash
}


no(){
    nvim $(fzf)
}


git-find-merge() {
  git rev-list $1..master --ancestry-path | \
  grep -f < \
  $(git rev-list $1..master --first-parent) | \
  tail -1
}

# Git Diff Files
gdf() {
  local default_branch=$(git rev-parse --abbrev-ref HEAD)
  local branch="${1:-$default_branch}"
  local base="${2:-master}"

  git diff --name-only origin/$base...$branch
}

git-stash-dir(){
  for D in *; do [ -d "${D}" ] && cd "${D}" && git stash && cd ..; done
}

review-latest-commit() {
    vim -c "let g:gitgutter_diff_base = 'HEAD~1'" -c ":e!" $(git_diff_commit)
}

garch() {
  local commit=$(git rev-list -n 1 --before="$1" master)
  git checkout ${commit}
}

# make a backup of a file https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
bk() {
    cp -a "$1" "${1}_$(date +%F__%T)"
}

# open a web browser on google for a query
goo(){
    open "https://www.google.com/search?q=$(rawurlencode "${(j: :)@}")"
}

#number conversion
h2d(){
    echo "ibase=16; $@"|bc
}

b2d(){
    echo "ibase=2; $@"|bc
}

d2h(){
    echo "obase=16; $@"|bc
}

d2b(){
    echo "obase=2; $@"|bc
}

#milliseconds to hours
m2h(){
 bc -l <<< "scale=2; $1/3600000"
}

open_file(){
    cmd.exe /c start "$*"
}

# fzf file search
fs(){
 local files
 IFS=$'\n'
 files=$(fzf --select-1 --height 60% --layout reverse --info inline --border)

 case $(file --mime-type "${files[@]}" -bL) in
     text/*|application/json) $EDITOR "${files[@]}";;
     *) [[ -z "${files[@]}" ]] && return || echo ""${files[@]}"" | open_file ;;
 esac
}

# find in files, rg & fzf
fif() {
    RG_PREFIX="rg -i -l --column --line-number --no-heading --hidden"
    local files
    files="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort \
                --phony -q "$1" \
                -m \
                -e \
                --ansi \
                --disabled \
                --reverse \
                --bind "ctrl-a:select-all" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
    )" && $EDITOR "${files[@]}"
}

#fzf kill process
fkill() {
 pid=$(ps -ef | sed 1d | fzf-tmux -r 70% --multi --select-1 --height 60% --layout reverse --info inline --border | awk '{print $2}')

 echo $pid

 if test -n "$pid"; then
     echo $pid | xargs kill -9
 fi
}

wkd() {
 echo "Today: $(date +'%F') Week: $(date +'%U')"
}

