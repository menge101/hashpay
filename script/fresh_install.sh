#!/usr/bin/bash
#install postgres then setup postgres - includes bundle install and db build
sh /script/postgresql_install.sh
#install chromedriver
sh /script/chrome_driver_install.sh
#run cukes
rake cucumber