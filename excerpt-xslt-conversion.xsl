<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:template match="/">
        <html>
            <head>Excerpts</head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="title">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="writer">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="//body">
        <p><xsl:apply-templates/></p><hr/>
    </xsl:template>
    
    <xsl:template match="line">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
</xsl:stylesheet>