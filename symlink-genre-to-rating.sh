#! /bin/bash

# USAGE:
#
# symlink-genre-to-rating.sh parent-directory-with-original-files-by-genre symlink-directory-by-rating

calling_path=$(pwd)
from_directory=$1
symlink_directory=$2
rating_min=3
rating_max=5

# maybe some files on the destination are changed and symlinks are broken
# so first remove those symlinks
find "$symlink_directory" -type l -xtype l -delete

# loop over all the directories and create the symlinks
for rating in $(seq $rating_min $rating_max);
do
  while IFS= read subpath; do
    mkdir -p "$symlink_directory/${rating}Star/$subpath"
    ln -sf "$calling_path/$from_directory/$subpath/${rating}Star/"* "$symlink_directory/${rating}Star/$subpath/"
  done < <(find $from_directory -type d | grep -v Star | sed "s/$from_directory//")
done

# the ln -s with asterisk * makes also non existing symlinks from literal *
# additional we want to remove symlinks that are not valid anymore.
find "$symlink_directory/" -type l -xtype l -delete

echo 'symlinks created and/or updated'
