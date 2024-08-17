for branch in $(git branch -r | grep -v '\->' | grep -v 'origin/HEAD'); do
    # Extract the branch name (remove 'origin/')
    branch_name=${branch#origin/}
    # Check if the branch already exists locally
    if ! git show-ref --verify --quiet refs/heads/$branch_name; then
        # Create and track the branch
        git checkout -b $branch_name $branch
    fi
done

