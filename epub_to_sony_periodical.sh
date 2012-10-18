#!/bin/sh
#
# Script to transform a regular epub file into a Sony reader "periodical"
# The steps done by the script, are:
#  1. Extract the OEBPS/content.opf file from the epub
#  2. add the following tag to the <metadata> element of the content.opf file:
#      <meta name="calibre:publication_type" content="periodical:magazine:Lightspeed Magazine"/>
#  3. Reinsert the content.opf file into the epub file
#  4. Do an epub->epub conversion with a "Sony reader" output profile
#     The resulting epub file will be a Sony reader publication.  This will not impact how it is shown
#     in other epub readers.
#

INPUT_FILE=$1
OUTPUT_FILE=periodical.epub
echo "INPUT_FILE: $INPUT_FILE"

#  1. Extract the OEBPS/content.opf file from the epub
CONTENT_OPF=content.opf
rm -r OEBPS
unzip $INPUT_FILE OEBPS/$CONTENT_OPF

#  2. add the following tag to the <metadata> element of the content.opf file:
TEMPFILE=tempfile
xsltproc ./add_periodical_type.xsl OEBPS/$CONTENT_OPF >$TEMPFILE
mv $TEMPFILE OEBPS/$CONTENT_OPF

#  3. Reinsert the content.opf file into the epub file
zip  $INPUT_FILE --freshen OEBPS/$CONTENT_OPF

#  4. Do an epub->epub conversion with a "Sony reader" output profile
ebook-convert $INPUT_FILE $OUTPUT_FILE --output-profile=sony
