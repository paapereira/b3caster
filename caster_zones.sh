#!/bin/bash

#===============================================================================
# caster_zones.sh
#
# Create Caster Zones on DirCaster. 
# Each Caster Zone is a different podcast.
#
#===============================================================================

# get config variables
runningscript=`basename "$0"`
basedir=`echo "$0" | awk -F"$runningscript" '{ print $1 }'`
configdir=$basedir/config
. $configdir/b3caster.conf

# caster_zones.sh variables
dirtemplates=$dircaster/templates/
dirpodcasts=podcasts/
configinctemplate=$dirtemplates/config_inc_template.php
dircastertemplate=$dirtemplates/dircaster_template.php
configincprefix=config_inc_
dircasterprefix=dircaster_
dirpodcastsprefix=podcasts_
sufix=.php
dirimages=images/
linkimage=$link$dirimages


#===============================================================================
# Create caster zones

while read line; do

  # ignore commented lines
  if ! [[ "${line:0:1}" = "#" ]] ; then

    # information about this$ dircaster caster zone
    configinc=$configincprefix$(echo "$line" | cut -d';' -f1)$sufix
    dircasterfile=$dircasterprefix$(echo "$line" | cut -d';' -f1)$sufix
    title=$(echo "$line" | cut -d';' -f2)
    mediadir=$dirpodcasts$dirpodcastsprefix$(echo "$line" | cut -d';' -f1)
    imagefile=$(echo "$line" | cut -d';' -f3)

    # create a config file for this caster zone
    cp $dircaster$configinctemplate $dircaster$configinc
    cat $dircaster$configinc | \
      sed "s/REPLACE_TITLE/$title/g" | \
      sed "s/REPLACE_LINK/$(echo $link$dircasterfile | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" | \
      sed "s/REPLACE_MEDIA_DIR/$(echo $mediadir | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" | \
      sed "s/REPLACE_IMAGE_FILE/$(echo $linkimage$imagefile | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" \
      > $dircaster${configinc}.tmp
    mv $dircaster${configinc}.tmp $dircaster${configinc}
    chown www-data:www-data $dircaster${configinc} $dirpodcasts$dirimages$imagefile
    chmod 750 $dircaster${configinc} $dirpodcasts$dirimages$imagefile

    # create a dircaster for this caster zone
    cp $dircaster$dircastertemplate $dircaster$dircaster
    cat $dircaster$dircaster | sed "s/REPLACE_CONFIG_INC.PHP/$configinc/g" > $dircaster${dircaster}.tmp
    mv $dircaster${dircaster}.tmp $dircaster${dircaster}
    chown www-data:www-data $dircaster${dircaster}
    chmod 750 $dircaster${dircaster}

    # create a dir for this caster zone podcasts
    mkdir -p $dircaster$dirpodcasts$dirpodcastsprefix$(echo "$line" | cut -d';' -f1)
    chown -R www-data:www-data $dircaster$dirpodcasts
    chmod -R 750 $dircaster$dirpodcasts

  fi
done < $configdir/caster_zones.conf

#eof
