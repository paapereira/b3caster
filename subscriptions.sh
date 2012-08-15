#!/bin/bash

#===============================================================================
# subscriptions.sh
#
# DESCRIPTION: Copy podcasts for each Caster Zone
#
#===============================================================================

# get config variables
runningscript=`basename "$0"`
basedir=`echo "$0" | awk -F"$runningscript" '{ print $1 }'`
configdir=$basedir/config
. $configdir/b3caster.conf

# subscriptions.sh variables
dircasterpodcasts=$dircaster/podcasts/
podcastdirprefix=podcasts_


#===============================================================================
# Copy podcasts to caster zones

while read line; do

  # ignore commented lines
  if ! [[ "${line:0:1}" = "#" ]] ; then

    dircasterzone=$dircasterpodcasts$podcastdirprefix$(echo "$line" | cut -d';' -f1)
    podcast=$podcastdir/$(echo "$line" | cut -d';' -f2)

    rsync \
      --verbose --recursive --times --perms --links --archive --checksum \
      --update --delete --delete-excluded \
      $podcast/ \
      $dircasterzone

    chown -R www-data:www-data $dircasterzone/*
    chmod -R 775 $dircasterzone/*

  fi
done < $configdir/subscriptions.conf

#eof
