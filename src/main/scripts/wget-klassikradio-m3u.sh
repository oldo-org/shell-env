#! /bin/bash -x
 
index_url='http://www.klassikradio.de/webplayer'
audio_url='http://stream.klassikradio.de/[^/]*'
 
for x in $(wget -q -O - "${index_url}" | grep -o "${audio_url}"); do
  echo "${x}" > "klassikradio-$(basename "${x}").m3u";
done
