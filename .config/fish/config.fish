#### Shell setup ####

# Add local executable dir to $PATH
set -g PATH $PATH "$HOME/.local/bin"

# Disable the greeting
set -g fish_greeting

# RedHat-like command prompt
# [user@host /dir/path]$
function short_hostname
    command hostname --short
end

function fish_prompt -d "Write out the prompt"
    printf '[%s@%s %s%s%s]$ ' $USER (short_hostname) \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end


#### Useful aliases and macros ####

# SSH to a host without remembering its fingerprint
alias tempssh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# Serve a directory via HTTP
function http-serve
  python3 -m http.server --directory $argv
end

# Create a directory and immediately switch to it
function mkcd
  mkdir $argv
  cd $argv
end

# opam configuration
source /home/dmbaturin/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
