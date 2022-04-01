#!/bin/sh
sudo touch /tmp/drupal.log && sudo chmod a+rw /tmp/drupal.log

tail -f /tmp/drupal.log &
