alias gai='git add -i'
alias gca='git commit -a'
alias gp='git push'
alias g_push_to_origin='git push --set-upstream origin `git branch | grep "*" | cut -d " " -f 2`'

# Rails
alias reset_test_db='rake db:drop db:create db:schema:load RAILS_ENV=test'

# Git (not existing on zsh plugin)
alias amend_commit='git commit --amend --no-edit'
alias delete_merged_branches='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d' # http://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
# Overwrite gd:
# alias gd='git diff --color | diff-highlight | strip_diff_leading_symbols' # Git diff with diff-highlight
alias gd='git diff --color | diff-so-fancy'

alias l='ls -G'

# OS/X
alias cls='reset'
