#! /bin/bash -ex

cd

source .config/user-dirs.dirs

mkdir -p \
  $XDG_DESKTOP_DIR \
  $XDG_DOCUMENTS_DIR \
  $XDG_DOWNLOAD_DIR \
  $XDG_MUSIC_DIR \
  $XDG_PICTURES_DIR \
  $XDG_PUBLICSHARE_DIR \
  $XDG_TEMPLATES_DIR \
  $XDG_VIDEOS_DIR
