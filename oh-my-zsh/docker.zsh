# Aliases for shortening Docker commands
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dps="docker ps"

# Get the Docker bridge IP
alias dip="ifconfig | grep -A 3 "bridge100" | grep \"inet\" | head -n 1 | cut -d ' ' -f 2"
