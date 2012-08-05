#!/bin/bash

#===============================================================================
# downloader.sh
#
# DESCRIPTION:  A simple podcast fetcher based on http://lincgeek.org/bashpodder
# My take was based on Farhad's (http://slexy.org/view/s2MxMjFIYN)
#
#===============================================================================

# get config variables
runningscript=`basename "$0"`
basedir=`echo "$0" | awk -F"$runningscript" '{ print $1 }'`
configdir=$basedir/config
. $configdir/b3caster.conf

mkdir -p $podcastdir

if [ -f "${podcastdir}/downloaded.tmp" ] ; then
    rm "${podcastdir}/downloaded.tmp"
fi

while read line; do
    podcasturl=$(echo "$line" | cut -d' ' -f1)
    files=$(wget -q -O- "$podcasturl" | grep -o '<enclosure.*url="[^"]*' | grep -o '[^"]*$')
    for file in $files; do
        podcastname=$(echo "$line" | cut -d' ' -f2)
        filename=$(echo "$file" | awk -F/ '{print $NF}')
        echo $file >> "${podcastdir}/downloaded.tmp"
        mkdir -p $podcastdir/$podcastname
        if ! grep "$file" $podcastdir/downloaded.log &> /dev/null ; then
            wget -t 10 -c -O "$podcastdir/$podcastname/$filename" "$file"
        fi
    done
done < $configdir/urls.conf

cat $podcastdir/downloaded.log >> $podcastdir/downloaded.tmp
sort -u $podcastdir/downloaded.tmp | uniq > $podcastdir/downloaded.log

#eof
