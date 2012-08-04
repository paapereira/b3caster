#!/bin/bash

# download new podcasts
./downloader.sh

# ensure caster zones
./caster_zones.sh

# take care of subscriptions
./subscriptions.sh

#eof
