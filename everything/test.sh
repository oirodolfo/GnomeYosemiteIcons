#!/bin/bash
find "Source Files/" -maxdepth 1 -type d | sed 's/Source Files\///g' | sed -n '1!p' | while read folderName; do
	ls "Source Files/$folderName" | cut -d '"' -f 2 | while read fileName; do
		find "/usr/share/icons/Numix-Circle-Light/" -maxdepth 1 -type d | sed 's/\/usr\/share\/icons\/Numix-Circle-Light\///g' | sed -n '1!p' | while read numixSize; do
			if [ -d "/usr/share/icons/Numix-Circle-Light/$numixSize/$folderName" ];
			then
				find "/usr/share/icons/Numix-Circle-Light/$numixSize/$folderName/" -lname $fileName -printf "%f\n" | cut -d '"' -f 2 | while read ic; do
					echo "linking $fileName to $ic"
					#rm "48x48/apps/$ic" > /dev/null 2>&1
					#ln -s "$fileName" "48x48/apps/$ic"
				done
			fi
		done
	done
done
