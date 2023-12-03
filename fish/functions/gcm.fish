function gcm
  set main_branch_exists_locally $(git branch --list main)
  # echo $main_branch_exists_locally
  #
  # Since "main" is the default branch name these days it should "win" over "master"
  #
  if test (string length -- "$main_branch_exists_locally") -gt 0
    # echo "The string has a length greater than zero."
	  git checkout main
  else
    # echo "The string is empty or does not exist."
    git checkout master
  end
end
