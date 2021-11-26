#!/bin/bash

if command -v drush &> /dev/null
then
  until drush runserver http://127.0.0.1:8888; do echo "program ended with status $?"; done &
fi

