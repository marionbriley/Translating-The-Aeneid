<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double" select="count(distinct-values(//name/@nametype)) * ($barWidth + 80)"/>
    <xsl:variable name="maxHeight" as="xs:double" select="40"/>
    <xsl:variable name="yScale" as="xs:double" select="10"/>
    
    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="1000" height="1000">
            <g transform="translate(100, 450)">
                <xsl:apply-templates select="//latin"/>
                <xsl:apply-templates select="//english"/>
                <xsl:apply-templates select="//german"/>
                <xsl:apply-templates select="//spanish"/> 
                
                <!-- AXES -->
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight * 5}" stroke="black" stroke-linecap="square"/>
                <!-- Y-AXIS SCALE -->
                <xsl:for-each select=".5, 1, 1.5, 2">
                    <xsl:variable name="height" as="xs:double" select=". * 10 * $yScale"/>
                    <line x1="0" y1="-{$height}" x2="-10" y2="-{$height}" stroke="black"/>
                    <line x1="0" y1="-{$height}" x2="{$maxWidth}" y2="-{$height}" stroke="lightgray"/>
                    <text x="-20" y="-{$height}" text-anchor="end" alignment-baseline="central">
                        <xsl:value-of select=". * 10"/>
                    </text>
                </xsl:for-each>
                <!-- AXIS LABELS -->
                <text x="{$maxWidth div 2}" y="{40}" text-anchor="middle" font-size="larger">Types of Names</text>
                <text x="-50" y="-{$maxHeight * 5 div 2}" writing-mode="tb" text-anchor="middle" font-size="larger">Occurrences</text>
            
                <!-- COLOR KEY -->   
                <rect y="-148" x="{$maxWidth + 60}" height="20" width="20" fill="#003559" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-138" x="{$maxWidth + 100}" alignment-baseline="middle">Latin</text>
                <rect y="-112" x="{$maxWidth + 60}" height="20" width="20" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-102" x="{$maxWidth + 100}" alignment-baseline="middle">English</text>
                <rect y="-76" x="{$maxWidth + 60}" height="20" width="20" fill="black" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-66" x="{$maxWidth + 100}" alignment-baseline="middle">German</text>
                <rect y="-40" x="{$maxWidth + 60}" height="20" width="20" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-30" x="{$maxWidth + 100}" alignment-baseline="middle">Spanish</text>
                
            </g>
        </svg>
    </xsl:template>
    <!-- ACTUAL DATA -->
    <xsl:template match="latin">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{0}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="#003559" stroke-width="1" stroke="black"/>
        <rect x="{200}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        
    </xsl:template>
    <xsl:template match="english">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{40}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="#fff0d6" stroke-width="1" stroke="black"/>
        <rect x="{240}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1"/>
    </xsl:template>
    <xsl:template match="german">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{80}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="black" stroke-width="1" stroke="black"/>
        <rect x="{280}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="black" stroke="black" stroke-width="1"/>
    </xsl:template>
    <xsl:template match="spanish">
        <xsl:variable name="names" select="count(book/excerpt/body/line/name[@nametype eq 'name'])" as="xs:double"/>
        <xsl:variable name="nickname" select="count(book/excerpt/body/line/name[@nametype eq 'nickname'])" as="xs:double"/>

        
        <!-- BARS -->
        <rect x="{120}" y="-{$yScale * $names}" width="{$barWidth}" height="{$names * $yScale}" fill="#b8dbff" stroke-width="1" stroke="black"/>
        <rect x="{320}" y="-{$yScale * $nickname}" width="{$barWidth}" height="{$nickname * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        
        <!-- LABELS -->
        <text x="80" y="20" text-anchor="middle">
            <xsl:value-of select="'Names'"/>
        </text>
        <text x="260" y="20" text-anchor="middle">
            <xsl:value-of select="'Nicknames'"/>
        </text>
        
    </xsl:template>
</xsl:stylesheet>