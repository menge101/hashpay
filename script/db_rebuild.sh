#!/usr/bin/bash

rake db:drop
rake db:create
rake db:migrate

if [ $RAILS_ENV != 'test' ]
  then
  rake db:seed
fi

