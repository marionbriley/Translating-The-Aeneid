<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double" select="count(distinct-values(//verb/@tense)) * ($barWidth + 80)"/>
    <xsl:variable name="maxHeight" as="xs:double" select="40"/>
    <xsl:variable name="yScale" as="xs:double" select="10"/>
    
    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="1000" height="1000">
            <g transform="translate(100, 450)">
                
                <!-- AXES -->
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight * 10}" stroke="black" stroke-linecap="square"/>
                <!-- Y-AXIS SCALE -->
                <xsl:for-each select="1 to 4">
                    <xsl:variable name="height" as="xs:double" select=". * 10 * $yScale"/>
                    <line x1="0" y1="-{$height}" x2="-10" y2="-{$height}" stroke="black"/>
                    <line x1="0" y1="-{$height}" x2="{$maxWidth}" y2="-{$height}" stroke="lightgray"/>
                    <text x="-20" y="-{$height}" text-anchor="end" alignment-baseline="central">
                        <xsl:value-of select=". * 5"/>
                    </text>
                </xsl:for-each>
                <!-- AXIS LABELS -->
                <text x="{$maxWidth div 2}" y="{10 * $yScale}" text-anchor="middle" font-size="larger">Verb Tenses</text>
                <text x="-50" y="-{$maxHeight * $yScale div 2}" writing-mode="tb" text-anchor="middle" font-size="larger">Occurrences</text>
                <!-- SKWAIR --><!-- this is where my squares would go...IF I HAD ANY... -->
                <xsl:apply-templates select="latin"/>
            </g>
        </svg>
    </xsl:template>
    
    <!-- DATA -->
    <xsl:template match="latin">
        <!--<xsl:variable name="latin_past_verbs" select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/> there are no past verbs in latin -->
        <xsl:variable name="latin_present_verbs" select="count(latin/book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
        <rect x="{200}" y="-{$yScale * $latin_present_verbs}" width="{$barWidth}" height="{$latin_present_verbs * $yScale}" fill="blue"/>
    </xsl:template>
    
    
    
    
    
    <!-- ACTUAL DATA -->
    
    
    
   <!-- <xsl:template match="latin">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
        **BARS**
        <rect x="{0}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="blue"/>
        <rect x="{200}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="blue"/>
        
    </xsl:template>
    <xsl:template match="english">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
         ***BARS**
        <rect x="{40}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="red"/>
        <rect x="{240}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="red"/>
    </xsl:template>
    <xsl:template match="german">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
         **BARS**
        <rect x="{80}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="yellow"/>
        <rect x="{280}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="yellow"/>
    </xsl:template>
    <xsl:template match="spanish">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
        
         **BARS**
        <rect x="{120}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="green"/>
        <rect x="{320}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="green"/>
        
         **LABELS**
        <text x="60" y="5" text-anchor="middle">
            <xsl:value-of select="'Names'"/>
        </text>
        <text x="260" y="5" text-anchor="middle">
            <xsl:value-of select="'Nicknames'"/>
        </text>
        
    </xsl:template>-->
</xsl:stylesheet>