#!/usr/bin/bash

if [[ -z $(which postgres) ]]; then
  #If this is a Mac
  if [[ $OSTYPE == darwin* ]]
    then
      brew install postgresql
      bundle install
      postgres -D /usr/local/var/postgres/
      psql -c "CREATE USER test SUPERUSER PASSWORD 'password1';" postgres
    else #assume ubuntu linux
      apt-get install postgresql
      apt-get install libpq-dev
      bundle install
      sudo -u postgres bash -c "psql -c \"CREATE USER hashpay SUPERUSER PASSWORD 'password1';\""
  fi
  # run db setup script
  sh script/db_rebuild.sh
fi

