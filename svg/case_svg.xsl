<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="barWidth" as="xs:double" select="50"/>
    <xsl:variable name="interbar" as="xs:double" select="$barWidth div 2"/>
    <xsl:variable name="maxWidth" as="xs:double" select="10 *($barWidth+$interbar)"/>
    <xsl:variable name="maxHeight" as="xs:double" select="100"/>
    <xsl:variable name="yScale" as="xs:double" select="5"/>
    
    <xsl:template match="/">
        <svg width="1200" height="800">
            <g transform="translate(100, {$yScale*$maxHeight+100})">
                <text x="-10" y="-0" text-anchor="end" font-size="larger">0</text>
                <line x1="0" y1="-{$maxHeight*$yScale div 4}" x2="{$maxWidth}" y2="-{$maxHeight*$yScale div 4}" stroke="lightgray" stroke-linecap="square" stroke-width="3" stroke-dasharray="10"/>
                <text x="-10" y="-{$maxHeight*$yScale div 4}" text-anchor="end" font-size="larger">25</text>
                <line x1="0" y1="-{$maxHeight*$yScale div 2}" x2="{$maxWidth}" y2="-{$maxHeight*$yScale div 2}" stroke="lightgray" stroke-linecap="square" stroke-width="3"/>
                <text x="-10" y="-{$maxHeight*$yScale div 2}" text-anchor="end" font-size="larger">50</text>
                <line x1="0" y1="-{$maxHeight*$yScale * .75}" x2="{$maxWidth}" y2="-{$maxHeight*$yScale * .75}" stroke="lightgray" stroke-linecap="square" stroke-width="3" stroke-dasharray="10"/>
                <text x="-10" y="-{$maxHeight*$yScale * .75}" text-anchor="end" font-size="larger">75</text>
                <line x1="0" y1="-{$maxHeight*$yScale}" x2="{$maxWidth}" y2="-{$maxHeight*$yScale}" stroke="lightgray" stroke-linecap="square" stroke-width="3"/>
                <text x="-10" y="-{$maxHeight*$yScale}" text-anchor="end" font-size="larger">100</text>
                <xsl:apply-templates select="//latin"/>
                <xsl:apply-templates select="//german"/>
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square" stroke-width="3"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight*$yScale + 30}" stroke="black" stroke-linecap="square" stroke-width="3"/>
                <text x="{$maxWidth div 2}" y="{15*$yScale}" text-anchor="middle" font-size="larger">Noun Case</text>
                <text x="-70" y="-{$maxHeight*$yScale div 2}" writing-mode="tb" text-anchor="middle" font-size="larger">Number of Nouns</text>
                <text x="{$maxWidth div 2}" y="-{($maxHeight * $yScale) + 75}" text-anchor="middle" font-size="larger" font-weight="bold">Comparison of Noun Case Usage</text>
            </g>
        </svg>
    </xsl:template>
    
    <xsl:template match="//latin">
        <!--Latin Variables-->
        <xsl:variable name="Nom" select="count(//latin/book/excerpt/body/line/noun[@case='nom'])" as="xs:double"/>
        <xsl:variable name="Gen" select="count(//latin/book/excerpt/body/line/noun[@case='gen'])" as="xs:double"/>
        <xsl:variable name="Dat" select="count(//latin/book/excerpt/body/line/noun[@case='dat'])" as="xs:double"/>
        <xsl:variable name="Acc" select="count(//latin/book/excerpt/body/line/noun[@case='acc'])" as="xs:double"/>
        <xsl:variable name="Abl" select="count(//latin/book/excerpt/body/line/noun[@case='abl'])" as="xs:double"/>
        <xsl:variable name="xPosLatNom" select="($interbar div 2)+ 0 * ($barWidth+$interbar)" as="xs:double"/>
        <xsl:variable name="xPosLatGen" select="($interbar div 2)+ 2 * ($barWidth+$interbar)" as="xs:double"/>
        <xsl:variable name="xPosLatDat" select="($interbar div 2)+ 4 * ($barWidth+$interbar)" as="xs:double"/>
        <xsl:variable name="xPosLatAcc" select="($interbar div 2)+ 6 * ($barWidth+$interbar)" as="xs:double"/>
        <xsl:variable name="xPosLatAbl" select="($interbar div 2)+ 8 * ($barWidth+$interbar)" as="xs:double"/>
        <xsl:variable name="LatColor" select='"orange"'/>
        <!--Latin Data-->
        <rect x="{$xPosLatNom}" y="-{$Nom * $yScale}" width="{$barWidth}" height="{$Nom * $yScale}" fill="{$LatColor}"/>
        <rect x="{$xPosLatGen}" y="-{$Gen * $yScale}" width="{$barWidth}" height="{$Gen * $yScale}" fill="{$LatColor}"/>
        <rect x="{$xPosLatDat}" y="-{$Dat * $yScale}" width="{$barWidth}" height="{$Dat * $yScale}" fill="{$LatColor}"/>
        <rect x="{$xPosLatAcc}" y="-{$Acc * $yScale}" width="{$barWidth}" height="{$Acc * $yScale}" fill="{$LatColor}"/>
        <rect x="{$xPosLatAbl}" y="-{$Abl * $yScale}" width="{$barWidth}" height="{$Abl * $yScale}" fill="{$LatColor}"/>
        
        <text x="{$xPosLatNom + $barWidth}" y="{5 * $yScale}" text-anchor="middle">Nominative</text>
        <text x="{$xPosLatGen + $barWidth}" y="{5 * $yScale}" text-anchor="middle">Genitive</text>
        <text x="{$xPosLatDat + $barWidth}" y="{5 * $yScale}" text-anchor="middle">Dative</text>
        <text x="{$xPosLatAcc + $barWidth}" y="{5 * $yScale}" text-anchor="middle">Accusative</text>
        <text x="{$xPosLatAbl + $barWidth}" y="{5 * $yScale}" text-anchor="middle">Ablative</text>
        <!--Key--> <text x="{$maxWidth + 175}" y="-{($maxHeight div 2 * $yScale)+90}" text-anchor="start" font-size="larger">Latin</text>
        <rect x="{$maxWidth + 150}" y="-{($maxHeight div 2 * $yScale)+100}" width="10" height="10" fill="{$LatColor}"/>
    </xsl:template>
    
    <xsl:template match="//german">
        <!--German Variables-->
        <xsl:variable name="Nom" select="count(//german/book/excerpt/body/line/noun[@case='nom'])" as="xs:double"/>
        <xsl:variable name="Gen" select="count(//german/book/excerpt/body/line/noun[@case='gen'])" as="xs:double"/>
        <xsl:variable name="Dat" select="count(//german/book/excerpt/body/line/noun[@case='dat'])" as="xs:double"/>
        <xsl:variable name="Acc" select="count(//german/book/excerpt/body/line/noun[@case='acc'])" as="xs:double"/>
        <xsl:variable name="xPosGerNom" select="(($interbar div 2)+ 1 * ($barWidth+$interbar)) - $interbar" as="xs:double"/>
        <xsl:variable name="xPosGerGen" select="(($interbar div 2)+ 3 * ($barWidth+$interbar)) - $interbar" as="xs:double"/>
        <xsl:variable name="xPosGerDat" select="(($interbar div 2)+ 5 * ($barWidth+$interbar)) - $interbar" as="xs:double"/>
        <xsl:variable name="xPosGerAcc" select="(($interbar div 2)+ 7 * ($barWidth+$interbar)) - $interbar" as="xs:double"/>
        <xsl:variable name="GerColor" select='"green"'/>
        <!--German Data-->
        <rect x="{$xPosGerNom}" y="-{$Nom * $yScale}" width="{$barWidth}" height="{$Nom * $yScale}" fill="{$GerColor}"/>
        <rect x="{$xPosGerGen}" y="-{$Gen * $yScale}" width="{$barWidth}" height="{$Gen * $yScale}" fill="{$GerColor}"/>
        <rect x="{$xPosGerDat}" y="-{$Dat * $yScale}" width="{$barWidth}" height="{$Dat * $yScale}" fill="{$GerColor}"/>
        <rect x="{$xPosGerAcc}" y="-{$Acc * $yScale}" width="{$barWidth}" height="{$Acc * $yScale}" fill="{$GerColor}"/>
        <!--Key--> <text x="{$maxWidth + 175}" y="-{($maxHeight div 2 * $yScale)+50}" text-anchor="start" font-size="larger">German</text>
        <rect x="{$maxWidth + 150}" y="-{($maxHeight div 2 * $yScale)+60}" width="10" height="10" fill="{$GerColor}"/>
    </xsl:template>
    
</xsl:stylesheet>