<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double" select="580"/>
    <xsl:variable name="maxHeight" as="xs:double" select="100"/>
    <xsl:variable name="yScale" as="xs:double" select="20"/>
    
    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="2500" height="2500">
            <g transform="translate(100, 700)">
                 
                
                <!-- AXES -->
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight * 3}" stroke="black" stroke-linecap="square"/>
                <!-- Y-AXIS SCALE --> 
                <xsl:for-each select=".5, 1, 1.5">
                    <xsl:variable name="height" as="xs:double" select=". * 10 * $yScale"/>
                    <line x1="0" y1="-{$height}" x2="-10" y2="-{$height}" stroke="black"/>
                    <line x1="0" y1="-{$height}" x2="{$maxWidth}" y2="-{$height}" stroke="lightgray"/>
                    <text x="-20" y="-{$height}" text-anchor="end" alignment-baseline="central">
                        <xsl:value-of select=". * 10"/>
                    </text>
                </xsl:for-each>
                <!-- AXIS LABELS -->
                <text x="{$maxWidth div 2}" y="{3 * $yScale}" text-anchor="middle" font-size="larger">Sound Devices in Each Language</text>
                <text x="-60" y="-{$maxHeight * 3 div 2}" writing-mode="tb" text-anchor="middle" font-size="larger">Occurrences</text>
                
                <xsl:apply-templates select="//latin"/>
                <xsl:apply-templates select="//english"/>
                <xsl:apply-templates select="//german"/>
                <xsl:apply-templates select="//spanish"/>
                
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
        <xsl:variable name="cons" select="count(book/excerpt/body/line/sound_device[@device eq 'consonance'])" as="xs:double"/>
        <xsl:variable name="all" select="count(book/excerpt/body/line/sound_device[@device eq 'alliteration'])" as="xs:double"/>
        <xsl:variable name="sib" select="count(book/excerpt/body/line/sound_device[@device eq 'sibilance'])" as="xs:double"/>
        <xsl:variable name="asso" select="count(book/excerpt/body/line/sound_device[@device eq 'assonance'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{0}" y="-{$yScale * $cons}" width="{$barWidth}" height="{$cons * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{100}" y="-{$yScale * $all}" width="{$barWidth}" height="{$all * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{280}" y="-{$yScale * $sib}" width="{$barWidth}" height="{$sib * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{500}" y="-{$yScale * $asso}" width="{$barWidth}" height="{$asso * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        
    </xsl:template>
    <xsl:template match="english">
        <xsl:variable name="all" select="count(book/excerpt/body/line/sound_device[@device eq 'alliteration'])" as="xs:double"/>
        <xsl:variable name="sib" select="count(book/excerpt/body/line/sound_device[@device eq 'sibilance'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{140}" y="-{$yScale * $all}" width="{$barWidth}" height="{$all * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1"/>
        <rect x="{320}" y="-{$yScale * $sib}" width="{$barWidth}" height="{$sib * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1"/>
        </xsl:template>
    <xsl:template match="german">
        <xsl:variable name="sib" select="count(book/excerpt/body/line/sound_device[@device eq 'sibilance'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{360}" y="-{$yScale * $sib}" width="{$barWidth}" height="{$sib * $yScale}" fill="black" stroke="black" stroke-width="1"/>
    </xsl:template>
    <xsl:template match="spanish">
        <xsl:variable name="all" select="count(book/excerpt/body/line/sound_device[@device eq 'alliteration'])" as="xs:double"/>
        <xsl:variable name="sib" select="count(book/excerpt/body/line/sound_device[@device eq 'sibilance'])" as="xs:double"/>
        <xsl:variable name="asso" select="count(book/excerpt/body/line/sound_device[@device eq 'assonance'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{180}" y="-{$yScale * $all}" width="{$barWidth}" height="{$all * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        <rect x="{400}" y="-{$yScale * $sib}" width="{$barWidth}" height="{$sib * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        <rect x="{540}" y="-{$yScale * $asso}" width="{$barWidth}" height="{$asso * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        
        <!-- LABELS -->
        <text x="20" y="20" text-anchor="middle">
            <xsl:value-of select="'Consonance'"/>
        </text>
        <text x="160" y="20" text-anchor="middle">
            <xsl:value-of select="'Alliteration'"/>
        </text>
        <text x="360" y="20" text-anchor="middle">
            <xsl:value-of select="'Sibilance'"/>
        </text>
        <text x="540" y="20" text-anchor="middle">
            <xsl:value-of select="'Assonance'"/>
        </text>
        
    </xsl:template>
</xsl:stylesheet>