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
themePorts[crash777]=3213
themePorts[java-sssbet]=3214

start_work_session() {
  local current_directory_name=$(basename "$PWD")
  tmuxinator start work_session -n "$current_directory_name" .
}

alias sws="start_work_session"
  
ppp() {
  yarn && THEME=$1 P=$themePorts[$1] yarn dev
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

wkspace() {
  local project_dir=~/Work/new-player-center-pro
  local branch_name="$1"
  # Replace invalid characters for a directory name with a hyphen
  local valid_dir_name=$(echo "$branch_name" | sed 's/[^a-zA-Z0-9._-]/-/g')
  local default_backend_type="php"
  local backend_type="${3:-$default_backend_type}"
  local resolved_wkspace_dir="$project_dir/$valid_dir_name"
  local remote_branch="$2"

  git fetch origin
  
  # create branch if it does not exist
  if git show-ref --verify --quiet refs/heads/$branch_name; then
    echo "Branch '$branch_name' already exists."
  else
    # Create the branch if it doesn't exist
    git branch "$branch_name"
    echo "Branch '$branch_name' created."
  fi

  if [ -z "$remote_branch" ]; then
    if git ls-remote --heads origin "$remote_branch" | grep -q "$remote_branch"; then
      git worktree add "$resolved_wkspace_dir" "$branch_name"
    else 
      echo "Remote $remote_branch does not exist." 
      return 1
    fi
  else 
    # make the local branch track the specified remote and reset all local changes to it
    git branch --force "$branch_name" "origin/$remote_branch"
    
    git worktree add "$resolved_wkspace_dir" "$branch_name"
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
