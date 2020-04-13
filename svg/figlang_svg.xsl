<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double" select="680"/>
    <xsl:variable name="maxHeight" as="xs:double" select="100"/>
    <xsl:variable name="yScale" as="xs:double" select="20"/>
    
    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="2500" height="2500">
            <g transform="translate(100, 700)">
                
                
                <!-- AXES -->
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight * $yScale div 10}" stroke="black" stroke-linecap="square"/>
                <!-- Y-AXIS SCALE --> 
                <xsl:for-each select="1 to 10">
                    <xsl:variable name="height" as="xs:double" select=". * $yScale"/>
                    <line x1="0" y1="-{$height}" x2="-10" y2="-{$height}" stroke="black"/>
                    <line x1="0" y1="-{$height}" x2="{$maxWidth}" y2="-{$height}" stroke="lightgray"/>
                    <text x="-20" y="-{$height}" text-anchor="end" alignment-baseline="central">
                        <xsl:value-of select="."/>
                    </text>
                </xsl:for-each>
                <!-- AXIS LABELS -->
                <text x="{$maxWidth div 2}" y="{3 * $yScale}" text-anchor="middle" font-size="larger">Figurative Language across Translations</text>
                <text x="-60" y="-{$maxHeight}" writing-mode="tb" text-anchor="middle" font-size="larger">Occurrences</text>
                
                <xsl:apply-templates select="//latin"/>
                <xsl:apply-templates select="//english"/>
                <xsl:apply-templates select="//german"/>
                <xsl:apply-templates select="//spanish"/>
                
                <!-- COLOR KEY -->   
                <rect y="-148" x="{$maxWidth + 60}" height="20" width="20" fill="#003559" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-138" x="{$maxWidth + 100}" alignment-baseline="middle">Latin</text>
                <rect y="-112" x="{$maxWidth + 60}" height="20" width="20" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-102" x="{$maxWidth + 100}" alignment-baseline="middle">English</text>
                <rect y="-76" x="{$maxWidth + 60}" height="20" width="20" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-66" x="{$maxWidth + 100}" alignment-baseline="middle">German</text>
                <rect y="-40" x="{$maxWidth + 60}" height="20" width="20" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
                <text y="-30" x="{$maxWidth + 100}" alignment-baseline="middle">Spanish</text>
                
                
            </g>
        </svg>
    </xsl:template>
    <!-- ACTUAL DATA -->
    <xsl:template match="latin">
        <xsl:variable name="ana" select="count(//fig_lang[@type eq 'anaphora'])" as="xs:double"/>
        <xsl:variable name="asy" select="count(//fig_lang[@type eq 'asyndeton'])" as="xs:double"/>
        <xsl:variable name="syn" select="count(//fig_lang[@type eq 'synchysis'])" as="xs:double"/>
        <xsl:variable name="sim" select="count(//fig_lang[@type eq 'simile'])" as="xs:double"/>
        <xsl:variable name="polyp" select="count(//fig_lang[@type eq 'polyptoton'])" as="xs:double"/>
        <xsl:variable name="poly" select="count(//fig_lang[@type eq 'polysyndeton'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{0}" y="-{$yScale * $ana}" width="{$barWidth}" height="{$ana * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{160}" y="-{$yScale * $asy}" width="{$barWidth}" height="{$asy * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{240}" y="-{$yScale * $syn}" width="{$barWidth}" height="{$syn * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{320}" y="-{$yScale * $sim}" width="{$barWidth}" height="{$sim * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{480}" y="-{$yScale * $polyp}" width="{$barWidth}" height="{$polyp * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        <rect x="{600}" y="-{$yScale * $poly}" width="{$barWidth}" height="{$poly * $yScale}" fill="#003559" stroke="black" stroke-width="1"/>
        
        
    </xsl:template>
    <xsl:template match="english">
        <xsl:variable name="ana" select="count(//fig_lang[@type eq 'anaphora'])" as="xs:double"/>
        <xsl:variable name="sim" select="count(//fig_lang[@type eq 'simile'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{40}" y="-{$yScale * $ana}" width="{$barWidth}" height="{$ana * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1"/>
        <rect x="{360}" y="-{$yScale * $sim}" width="{$barWidth}" height="{$sim * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1"/>
        </xsl:template>
    <xsl:template match="german">
        <xsl:variable name="poly" select="count(//fig_lang[@type eq 'polysyndeton'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{640}" y="-{$yScale * $poly}" width="{$barWidth}" height="{$poly * $yScale}" fill="white" stroke="black" stroke-width="1"/>
    </xsl:template>
    <xsl:template match="spanish">
        <xsl:variable name="ana" select="count(//fig_lang[@type eq 'anaphora'])" as="xs:double"/>
        <xsl:variable name="sim" select="count(//fig_lang[@type eq 'simile'])" as="xs:double"/>
        <xsl:variable name="polyp" select="count(//fig_lang[@type eq 'polyptoton'])" as="xs:double"/>
        
        <!-- BARS -->
        <rect x="{80}" y="-{$yScale * $ana}" width="{$barWidth}" height="{$ana * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        <rect x="{400}" y="-{$yScale * $sim}" width="{$barWidth}" height="{$sim * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        <rect x="{520}" y="-{$yScale * $polyp}" width="{$barWidth}" height="{$polyp * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1"/>
        
        <!-- LABELS -->
        <text x="60" y="20" text-anchor="middle">
            <xsl:value-of select="'Anaphora'"/>
        </text>
        <text x="180" y="20" text-anchor="middle">
            <xsl:value-of select="'Asyndeton'"/>
        </text>
        <text x="260" y="20" text-anchor="middle">
            <xsl:value-of select="'Synchysis'"/>
        </text>
        <text x="380" y="20" text-anchor="middle">
            <xsl:value-of select="'Simile'"/>
        </text>
        <text x="520" y="20" text-anchor="middle">
            <xsl:value-of select="'Polyptoton'"/>
        </text>
        <text x="640" y="20" text-anchor="middle">
            <xsl:value-of select="'Polysndeton'"/>
        </text>
        
    </xsl:template>
</xsl:stylesheet>