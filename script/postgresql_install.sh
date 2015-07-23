#!/usr/bin/bash

apt-get install postgresql
apt-get install libpq-dev
bundle install
# Create user role in postgres
sudo -u postgres bash -c "psql -c \"CREATE USER hashpay SUPERUSER PASSWORD 'password1';\""
# run db setup script
sh script/db_rebuild.sh
