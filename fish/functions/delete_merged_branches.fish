#
# http://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
#
function delete_merged_branches
  #
  # Existing merged branches
  #
  #                      All merged ones   | Not master, main, *
  set merged_branches (git branch --merged | grep -v -E "master|main|\*")
  # echo "merged_branches: $merged_branches"
  if [ (count $merged_branches) -eq 0 ]
    # echo "No branches to merge"
    return 0
  end


	# Remove branches:
	echo $merged_branches | xargs -n 1 git branch -d
end
