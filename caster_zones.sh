#!/bin/bash

dirb3caster=/www/b3caster/ # ==== change this
link=http://yoursite/b3caster/ # ==== change this
dirpodcasts=podcasts/
configinctemplate=config_inc_template.php
dircastertemplate=dircaster_template.php
configincprefix=config_inc_
dircasterprefix=dircaster_
dirpodcastsprefix=podcasts_
sufix=.php
dirimages=images/
linkimage=$link$dirimages

# ==============================================================
# Create caster zones

while read line; do

  # ignore commented lines
  if ! [[ "${line:0:1}" = "#" ]] ; then

    # information about this$dirb3caster caster zone
    configinc=$configincprefix$(echo "$line" | cut -d';' -f1)$sufix
    dircaster=$dircasterprefix$(echo "$line" | cut -d';' -f1)$sufix
    title=$(echo "$line" | cut -d';' -f2)
    mediadir=$dirpodcasts$dirpodcastsprefix$(echo "$line" | cut -d';' -f1)
    imagefile=$(echo "$line" | cut -d';' -f3)

    # create a config file for this caster zone
    cp $dirb3caster$configinctemplate $dirb3caster$configinc
    cat $dirb3caster$configinc | \
      sed "s/REPLACE_TITLE/$title/g" | \
      sed "s/REPLACE_LINK/$(echo $link$dircaster | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" | \
      sed "s/REPLACE_MEDIA_DIR/$(echo $mediadir | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" | \
      sed "s/REPLACE_IMAGE_FILE/$(echo $linkimage$imagefile | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" \
      > $dirb3caster${configinc}.tmp
    mv $dirb3caster${configinc}.tmp $dirb3caster${configinc}
    chown www-data:www-data $dirb3caster${configinc} $dirpodcasts$dirimages$imagefile
    chmod 750 $dirb3caster${configinc} $dirpodcasts$dirimages$imagefile

    # create a dircaster for this caster zone
    cp $dirb3caster$dircastertemplate $dirb3caster$dircaster
    cat $dirb3caster$dircaster | sed "s/REPLACE_CONFIG_INC.PHP/$configinc/g" > $dirb3caster${dircaster}.tmp
    mv $dirb3caster${dircaster}.tmp $dirb3caster${dircaster}
    chown www-data:www-data $dirb3caster${dircaster}
    chmod 750 $dirb3caster${dircaster}

    # create a dir for this caster zone podcasts
    mkdir -p $dirb3caster$dirpodcasts$dirpodcastsprefix$(echo "$line" | cut -d';' -f1)
    chown -R www-data:www-data $dirb3caster$dirpodcasts
    chmod -R 750 $dirb3caster$dirpodcasts

  fi
done < caster_zones.conf

#eof
