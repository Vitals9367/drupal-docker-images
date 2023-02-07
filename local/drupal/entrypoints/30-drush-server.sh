#!/bin/bash

if command -v drush &> /dev/null
then
  sleep 5 && drush runserver http://127.0.0.1:8888 &
fi

