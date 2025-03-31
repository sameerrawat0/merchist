#!/usr/bin/env bash

pip install -r requirements.txt

# Add other build commands (e.g., Django migrations, collectstatic)
python manage.py collectstatic --noinput
python manage.py migrate

# Inside the .env creation section
EMAIL_HOST_USER=\$EMAIL_HOST_USER  # Already in your existing script

# In the superuser creation command
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(email='\$SUPERUSER_EMAIL', username='\$SUPERUSER_USERNAME', password='\$SUPERUSER_PASSWORD', first_name='\$SUPERUSER_FIRST_NAME', last_name='\$SUPERUSER_LAST_NAME') if not User.objects.filter(username='\$SUPERUSER_USERNAME').exists() else None" | python manage.py shell
