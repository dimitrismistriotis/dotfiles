#   ___ _ _
#  / __(_) |_
# | (_ | |  _|
#  \___|_|\__|
#
alias amend_commit='git commit --amend --no-edit'
alias delete_merged_branches='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d' # http://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
