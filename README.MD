# Symlink Genre to Rating

Bash script to make a symlink rating based directory tree from a
directory tree where rating is the last child directory.

Usage:
```bash
symlink-genre-to-rating MusicByGenre MusicByRating

```
MusicByGenre is the existing directory sorted by genre.  
MusicByRating is the directory in which the symlinked equivalent
is generated starting with the rating.

## Naming convention of rating directories
* 3Star
* 4Star
* 5Star

## Structure of the from directory
A nesting of directories, in my case music genres, with in all
branches of the tree as last directory a rating directory
following the above naming convention.

### Example:
 * MusicByGenre 
   * EDM 
     * Electro
       * 3Star *(files)*
       * 4Star *(files)*
       * Electroclash
         * 3Star *(files)*
         * 4Star *(files)*
         * 5Star *(files)*
     * House & Garage
       * House
         * 3Star *(files)*
         * 4Star *(files)*
         * 5Star *(files)*
       * etc.
     * etc.
   * Urban
     * Hip Hop
       * 3Star *(files)*
       * 4Star *(files)*
       * 5Star *(files)*
     * etc.
   * etc.

### File placement
The (music) files are placed within the rating directories.
That are the directories which are named: 3Star, 4Star, 5Star

When there are no files for a given rating it's not required
to provide that directory, like with the MusicByGenre/EDM/Electro
example where I don't have 5Star Electro music.

### Result after running the script
* MusicByRating
  * 3Star
    * EDM
      * Electro *(files)*
        * Electroclash *(files)*
      * House & Garage
        * House *(files)*
      * etc.
    * Urban
      *  Hip Hop *(files)*
      * etc.
    * etc. 
  * 4Star
    * EDM
      * Electro *(files)*
        * Electroclash *(files)*
      * House & Garage
        * House *(files)*
      * etc.
    * Urban
      *  Hip Hop *(files)*
      * etc.
    * etc.
  * 5Star
    * EDM
      * Electro
        * Electroclash *(files)*
      * House & Garage
        * House *(files)*
      * etc.
    * Urban
      *  Hip Hop *(files)*
      * etc.
    * etc.

## Other ratings
Since I only need 3Star and higher ratings, only those are 
build into new symlinks by the script. This is set in the 
`rating_min` and `rating_max` variables in the script.

## Other applications
As long as the first directory is of the structure
/some/directory/structure/3Star/* where 3Star can ofcourse
also be 4Star or 5Star. And where the * is where all the
files of that rating are. This script can also be used
for other purposes then music, like rated art, or pictures etc.

## Background
I created this script to have a directory structure with the same
(symlinked) content but organized by the rating.

In this way, it's easy to import or copy all files from a given rating
to an application or directory of my choice.

So for example on my phone I only want 4 and 5 star rated music, so
I only copy these two directories over from the generated MusicByRating
structure without the need to dig into the MusicByGenre directory.

Since the alternative structure is based on symlinks I still
have the original MusicByGenre structure which I prefer for
browsing and organizing my music.

Each time when I've added music or made changes, which I do
in the original MusicByGenred directory, I run the command and
I've everything available by rating.

