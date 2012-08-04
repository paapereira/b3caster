#!/bin/bash

dirb3casterpodcasts=/www/b3caster/podcasts/ # ==== change this
dirpodcasts=/storage/b3caster/ # ==== change this
dirpodcastsprefix=podcasts_

# ==============================================================
# Copy podcasts to caster zones

while read line; do

  # ignore commented lines
  if ! [[ "${line:0:1}" = "#" ]] ; then

    dircaster=$dirb3casterpodcasts$dirpodcastsprefix$(echo "$line" | cut -d';' -f1)
    podcast=$dirpodcasts$(echo "$line" | cut -d';' -f2)

    rsync -auv $podcast/ $dircaster

  fi
done < subscriptions.conf

#eof
