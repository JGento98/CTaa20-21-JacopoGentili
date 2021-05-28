<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:html="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output 
method="html" 
version="5.0"
indent="yes"/>

<xsl:template match="/">

 <xsl:element name="html">

    <xsl:element name ="head">
        <title><xsl:value-of select="test/msg" /></title>
    </xsl:element>

    <xsl:element name="body">
        <div>
            <h1><xsl:value-of select="test/title" /></h1>
        </div>
        
        <div>
            <xsl:for-each select="//div" >
              <div><xsl:value-of select="p" /></div>
              <xsl:apply-templates select="div" />
              <hr></hr>
            </xsl:for-each>
        </div>
      
    </xsl:element>
 </xsl:element>

</xsl:template>


</xsl:stylesheet>