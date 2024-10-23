# collection of useful shortcuts for work

declare -A themePorts
themePorts[sssbet]=3205
themePorts[hugebet]=3201
themePorts[spaceman]=3202
themePorts[amusino]=3203
themePorts[777bet]=3204
themePorts[kash777]=3200
themePorts[smash]=3206
themePorts[t1bet]=3207
themePorts[betacai]=3208
themePorts[alpha]=3210
themePorts[fastwin]=3211
themePorts[mbet]=3212

start_work_session() {
  local current_directory_name=$(basename "$PWD")
  tmuxinator start work_session -n "$current_directory_name" .
}

alias sws="start_work_session"
  
ppp() {
  yarn && THEME=$1 yarn dev -- -- -p $themePorts[$1]
}

ptest() {
  THEME=$1 yarn theme && tsc --noEmit --project tsconfig.json && npx eslint ./src --ext .js,.jsx,.ts,.tsx --quiet
}

pport() {
  echo $themePorts[$1]
}

pall() {
  local project_dir=~/Work/player-center-pro

  themes=("sssbet" "hugebet" "amusino" "777bet" "smash" "t1bet" "betacai" "alpha" "fastwin" "mbet")

  for theme in $themes; do
    cd $project_dir/$theme
    tmuxinator start work_session -n $theme .
  done
}

check_worktree_exists() {
  local worktree_path="$1"

  # Check if the path exists in the worktree list
  if git worktree list | grep -q "$worktree_path"; then
    return 0  # Worktree exists, return true (exit status 0)
  else
    return 1  # Worktree does not exist, return false (exit status 1)
  fi
}

wkspace() {
  local branch_name="$1"
  shift
  
  local remote_branch=""
  local parsed_backend_type=""
  local parsed_from_branch=""

  while getopts ":r:t:f:x:" opt; do
    case $opt in
      r)
        remote_branch=$OPTARG
        ;;
      t)
        parsed_backend_type=$OPTARG
        ;;
      f)
        parsed_from_branch=$OPTARG
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
      :)
        echo "Option -$OPTARG required an argument." >&2
        return 1
        ;;
    esac
  done

  shift $((OPTIND - 1))

  local project_dir=~/Work/new-player-center-pro
  # Replace invalid characters for a directory name with a hyphen
  local valid_dir_name=$(echo "$branch_name" | sed 's/[^a-zA-Z0-9._-]/-/g')
  local default_backend_type="php"
  local backend_type="${parsed_backend_type:-$default_backend_type}"
  local resolved_wkspace_dir="$project_dir/$valid_dir_name"
  local current_branch=$(git branch --show-current)
  local from_branch="${parsed_from_branch:-$current_branch}"

  if check_worktree_exists $resolved_wkspace_dir; then
    echo "Worktree $1 already exists."
    return 1 
  fi

  git fetch origin
  
  # create branch if it does not exist
  if git show-ref --verify --quiet refs/heads/$branch_name; then
    echo "Branch '$branch_name' not created as it already exists."
  else
    if [ -z "$from_branch" ]; then
      git branch "$branch_name"
      echo "Branch '$branch_name' created."
    else
      git branch "$branch_name" "$from_branch" 
      echo "Branch '$branch_name' created from $from_branch"
    fi
  fi

  if [ -z "$remote_branch" ]; then
    git worktree add "$resolved_wkspace_dir" "$branch_name"
    echo "Worktre $resolved_wkspace_dir created"
  else 
    if git ls-remote --heads origin "$remote_branch" | grep -q "$remote_branch"; then
      local tracking_remote=$(git for-each-ref --format='%(upstream:short)' "refs/heads/$branch_name")

      if [[ "$tracking_remote" == "$remote_branch"* ]]; then
        echo "Branch '$branch_name' is already tracking remote '$remote_branch'."
      else
        echo "Branch '$branch_name' is NOT tracking remote '$remote_branch'. Changing it to track the provided remote."
        # make the local branch track the specified remote and reset all local changes to it
        git branch --force "$branch_name" "origin/$remote_branch"
      fi
      
      git worktree add "$resolved_wkspace_dir" "$branch_name"
      echo "Worktre $resolved_wkspace_dir created"
    else 
      echo "Remote $remote_branch does not exist." 
      return 1
    fi
  fi
  
  if [ "$backend_type" = "php" ]; then
    cp "$project_dir/.env.php.local" "$resolved_wkspace_dir/.env.local"
    echo "Copied .env.local file for PHP"
  elif [ "$backend_type" = "java" ]; then
    cp "$project_dir/.env.java.local" "$resolved_wkspace_dir/.env.local"
    echo "Copied .env.local file for JAVA"
  else
    echo "Invalid backend type"
    return 1
  fi
  
  # Start tmuxinator with the project directory
  tmuxinator start work_session -n "$branch_name" "$resolved_wkspace_dir"
}
