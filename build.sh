#!/usr/bin/env bash

pip install -r requirements.txt


# Create .env file
cat <<EOT > .env
SECRET_KEY=3w7qyl@ft%=!ch\$e+hbk#gb_6-063=#-dzjyw)7awtresffv^^
DEBUG=True
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=youremailaddress@gmail.com
EMAIL_HOST_PASSWORD=yourStrongPassword
EMAIL_USE_TLS=True
EOT



# Add other build commands (e.g., Django migrations, collectstatic)
python manage.py collectstatic --noinput
python manage.py migrate

# Inside the .env creation section
EMAIL_HOST_USER=\$EMAIL_HOST_USER  # Already in your existing script

# In the superuser creation command
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(email='\$SUPERUSER_EMAIL', username='\$SUPERUSER_USERNAME', password='\$SUPERUSER_PASSWORD', first_name='\$SUPERUSER_FIRST_NAME', last_name='\$SUPERUSER_LAST_NAME') if not User.objects.filter(username='\$SUPERUSER_USERNAME').exists() else None" | python manage.py shell
