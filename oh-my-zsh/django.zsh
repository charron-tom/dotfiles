# System checks
alias check="docker exec -it django-container ./manage.py check"

# Start a shell_plus session inside the container
alias shell="docker exec -it django-container python manage.py shell_plus"

# Generate migrations
alias makemigrations="docker exec -it django-container ./manage.py makemigrations"

# Migrate the database
alias migrate="docker exec -it django-container ./manage.py migrate"

# Run django tests
alias testcp="docker exec -it django-container ./manage.py test -keepdb --local"
