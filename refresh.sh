#!/bin/bash
sizes=("16x16" "22x22" "24x24" "32x32" "48x48" "64x64" "96x96" "128x128" "256x256" "scalable")
foldTypes=("actions" "apps" "categories" "devices" "emblems" "mimetypes" "places" "status")

for size in "${sizes[@]}"; do
	rm -r "$size" >/dev/null 2>&1
	mkdir "$size"
	for type in "${foldTypes[@]}"; do
		mkdir "$size/$type"
	done
done

cp -r Source\ Files/* .

if [ -d "/usr/share/icons/Numix-Circle-Light/48x48/apps/" ]; then
  if [ -d "/usr/share/icons/Numix/128x128/places/" ]; then
    ./numixLinks
  fi
fi

rm -r "GnomeYosemiteIcons" >/dev/null 2>&1
mkdir GnomeYosemiteIcons
for size in "${sizes[@]}"; do
	mv "$size" GnomeYosemiteIcons/
done
