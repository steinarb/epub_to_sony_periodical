<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.idpf.org/2007/opf" xmlns:opf="http://www.idpf.org/2007/opf" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:output method="xml" indent="yes"/>
 
 <xsl:template match="opf:metadata">
  <metadata  xmlns:dc="http://purl.org/dc/elements/1.1/">
   <xsl:apply-templates select="@* | node()"/>
   <meta name="calibre:publication_type" content="periodical:magazine:Lightspeed Magazine"/>
   <xsl:text>
</xsl:text>
  </metadata>
 </xsl:template>

 <xsl:template match="@* | node()">
  <xsl:copy>
   <xsl:apply-templates select="@* | node()"/>
  </xsl:copy>
 </xsl:template>
</xsl:stylesheet>
