# Projects workspace
proj() {
    mkdir -p ~/projects
    local name="$1"
    if [[ -z "$name" ]]; then
        echo "Projects:"
        ls -1 ~/projects/ 2>/dev/null
        return
    fi

    local project_dir="$HOME/projects/$name"
    mkdir -p "$project_dir"

    # Auto-init git if not exists
    if [[ ! -d "$project_dir/.git" ]]; then
        echo "Initialize git repo? (Y/n)"
        read -r init_git
        if [[ ! "$init_git" =~ ^[Nn]$ ]]; then
            cd "$project_dir" && git init
        fi
    fi

    # Start/attach tmux session
    if tmux has-session -t "proj-$name" 2>/dev/null; then
        tmux attach-session -t "proj-$name"
    else
        tmux new-session -d -s "proj-$name" -c "$project_dir"
        tmux attach-session -t "proj-$name"
    fi
}

# Throwaway workspace
tmp() {
    local name="${1:-test-$(date +%m%d-%H%M)}"
    local test_dir="/tmp/experiments/$name"
    mkdir -p "$test_dir"

    if tmux has-session -t "test-$name" 2>/dev/null; then
        tmux attach-session -t "test-$name"
    else
        tmux new-session -d -s "test-$name" -c "$test_dir"
        tmux attach-session -t "test-$name"
    fi
}
