epub_to_sony_periodical
=======================

Script to transform an epub file into an epub file that a Sony reader
will interpret as a periodical.  This changes where it is stored on
download, and how it is presente when read.

Each periodical gets its own section in the "Periodicals" area in the
reader.  New issues are shown on the front page as new deliveries.
Periodicals don't go into the other collections (they are not shown in
the most recently read collection).

There is also a TOC button shown all the time in periodicals, for
quick navigation.

The script runs in bourne shell and requires the zip and unzip and
xsltproc command line utilities (google them).

The script also requires the ebook-convert command line utility from
the ebook management program calibre: http://calibre-ebook.com/

Usage:
 - Copy the epub file to be converted to the script directory
 - Run the command (replace "input_file".epub with your actual file name)
    ./epub_to_sony_periodical.sh input_file.epub

After the command has been run the periodicalized version of the file
will be in the file periodical.epub.