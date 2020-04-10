<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:template match="/">
        <html>
            <head><title>Excerpts</title></head>
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
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="line">
        <strong><xsl:apply-templates select="@num"/>. </strong><xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="book">
        <h3>Excerpt from Book <xsl:apply-templates select="@number"/>, regarding "<xsl:apply-templates select="excerpt/@subject"/>"</h3>
        <p><xsl:apply-templates/></p><hr/>
    </xsl:template>
    
    <xsl:template match="verb">
        <span class="verb">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="noun">
        <span class="noun">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
        
    <xsl:template match="sound_device">
        <span class="sound_device">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="name">
        <span class="name">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>