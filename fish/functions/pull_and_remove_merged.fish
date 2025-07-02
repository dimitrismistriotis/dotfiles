function pull_and_remove_merged
	git pull -r
	git fetch -p
	echo ""  # Spacing
	if type -q git-trim
		git-trim --no-confirm
	else
		delete_merged_branches
	end
end
