function pull_and_remove_merged
	git pull -r
	git fetch -p
	echo ""  # Spacing
	delete_merged_branches
end
