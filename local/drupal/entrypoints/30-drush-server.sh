#!/bin/bash

if command -v drush &> /dev/null
then
  sleep 5 && drush runserver $SIMPLETEST_BASE_URL --dns &
fi

