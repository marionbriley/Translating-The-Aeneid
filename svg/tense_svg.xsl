<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- VARIABLES -->
    <xsl:variable name="barWidth" as="xs:double" select="40"/>
    <xsl:variable name="maxWidth" as="xs:double"
        select="1040"/>
    <xsl:variable name="maxHeight" as="xs:double" select="50"/>
    <xsl:variable name="yScale" as="xs:double" select="5"/>


    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="1300" height="650">
            <g transform="translate(100, 575)">

                <!-- AXES -->
                <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black" stroke-linecap="square"/>
                <line x1="0" y1="0" x2="0" y2="-{$maxHeight * 10}" stroke="black"
                    stroke-linecap="square"/>
                <!-- Y-AXIS SCALE -->
                <xsl:for-each select="1 to 10">
                    <xsl:variable name="height" as="xs:double" select=". * 10 * $yScale"/>
                    <line x1="0" y1="-{$height}" x2="-10" y2="-{$height}" stroke="black"/>
                    <line x1="0" y1="-{$height}" x2="{$maxWidth}" y2="-{$height}" stroke="black"/>
                    <text x="-20" y="-{$height}" text-anchor="end" alignment-baseline="central">
                        <xsl:value-of select=". * 10"/>
                    </text>
                </xsl:for-each>
                <!-- AXIS LABELS -->
                <text x="{$maxWidth div 2}" y="{10 * $yScale}" text-anchor="middle"
                    font-size="larger">Tenses</text>
                <text x="-50" y="-{$maxHeight * $yScale}" writing-mode="tb"
                    text-anchor="middle" font-size="larger">Occurrences</text>
                <text x="{$maxWidth div 2}" y="{$maxHeight - 600}"
                    text-anchor="middle" font-size="larger">Tense Occurrences in Each Language</text>
               
                <xsl:apply-templates select="//latin"/>
                <xsl:apply-templates select="//english"/>
                <xsl:apply-templates select="//german"/>
                <xsl:apply-templates select="//spanish"/> 

            </g>
        </svg>
    </xsl:template>
    <!-- ACTUAL DATA -->
    <xsl:template match="latin">
        <xsl:variable name="latin_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
        <xsl:variable name="latin_imperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'imperfect'])" as="xs:double"/>
        <xsl:variable name="latin_perfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'perfect'])" as="xs:double"/>
        <xsl:variable name="latin_pluperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'pluperfect'])" as="xs:double"/>
        <xsl:variable name="latin_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>

        <!-- BARS -->
        <rect x="{300}" y="-{$yScale * $latin_present}" width="{$barWidth}"
            height="{$latin_present * $yScale}" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{500}" y="-{$yScale * $latin_imperfect}" width="{$barWidth}"
            height="{$latin_imperfect * $yScale}" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{660}" y="-{$yScale * $latin_perfect}" width="{$barWidth}"
            height="{$latin_perfect * $yScale}" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{740}" y="-{$yScale * $latin_pluperfect}" width="{$barWidth}"
            height="{$latin_pluperfect * $yScale}" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{820}" y="-{$yScale * $latin_future}" width="{$barWidth}"
            height="{$latin_future * $yScale}" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>

    </xsl:template>
    <xsl:template match="english">
        <xsl:variable name="english_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>
        <xsl:variable name="english_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
        <xsl:variable name="english_imperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'imperfect'])" as="xs:double"/>
        <xsl:variable name="english_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>

        <!-- BARS -->
        <rect x="{140}" y="-{$yScale * $english_past}" width="{$barWidth}"
            height="{$english_past * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{340}" y="-{$yScale * $english_present}" width="{$barWidth}"
            height="{$english_present * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{540}" y="-{$yScale * $english_imperfect}" width="{$barWidth}"
            height="{$english_imperfect * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{860}" y="-{$yScale * $english_future}" width="{$barWidth}"
            height="{$english_future * $yScale}" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
    </xsl:template>
    
    <xsl:template match="german">
        <xsl:variable name="german_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>
        <xsl:variable name="german_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
       <xsl:variable name="german_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>

        <!-- BARS -->
        <rect x="{180}" y="-{$yScale * $german_past}" width="{$barWidth}"
            height="{$german_past * $yScale}" fill="black" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{380}" y="-{$yScale * $german_present}" width="{$barWidth}"
            height="{$german_present * $yScale}" fill="black" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{900}" y="-{$yScale * $german_future}" width="{$barWidth}"
            height="{$german_future * $yScale}" fill="black" stroke="black" stroke-width="1" stroke-linecap="square"/>
    </xsl:template>
    
    <xsl:template match="spanish">
        <xsl:variable name="spanish_preterite" select="count(book/excerpt/body/line/verb[@tense eq 'preterite'])"
            as="xs:double"/>
        <xsl:variable name="spanish_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>
        <xsl:variable name="spanish_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
        <xsl:variable name="spanish_imperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'imperfect'])" as="xs:double"/>
        <xsl:variable name="spanish_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>

        <!-- BARS -->
        <rect x="{60}" y="-{$yScale * $spanish_preterite}" width="{$barWidth}" height="{$spanish_preterite * $yScale}"
            fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{220}" y="-{$yScale * $spanish_past}" width="{$barWidth}"
            height="{$spanish_past * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{420}" y="-{$yScale * $spanish_present}" width="{$barWidth}"
            height="{$spanish_present * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{580}" y="-{$yScale * $spanish_imperfect}" width="{$barWidth}"
            height="{$spanish_imperfect * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <rect x="{940}" y="-{$yScale * $spanish_future}" width="{$barWidth}"
            height="{$spanish_future * $yScale}" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>

        <!-- LABELS -->
        <text x="75" y="20" text-anchor="middle">
            <xsl:value-of select="'Preterite'"/>
        </text>
        <text x="200" y="20" text-anchor="middle">
            <xsl:value-of select="'Past'"/>
        </text>
        <text x="380" y="20" text-anchor="middle">
            <xsl:value-of select="'Present'"/>
        </text>
        <text x="560" y="20" text-anchor="middle">
            <xsl:value-of select="'Imperfect'"/>
        </text>
        <text x="680" y="20" text-anchor="middle">
            <xsl:value-of select="'Perfect'"/>
        </text>
        <text x="760" y="20" text-anchor="middle">
            <xsl:value-of select="'Pluperfect'"/>
        </text>
        <text x="900" y="20" text-anchor="middle">
            <xsl:value-of select="'Future'"/></text>
        
        <rect y="-148" x="1080" height="20" width="20" fill="white" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <text y="-138" x="1120" alignment-baseline="middle">Latin</text>
        <rect y="-112" x="1080" height="20" width="20" fill="#fff0d6" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <text y="-102" x="1120" alignment-baseline="middle">English</text>
        <rect y="-76" x="1080" height="20" width="20" fill="black" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <text y="-66" x="1120" alignment-baseline="middle">German</text>
        <rect y="-40" x="1080" height="20" width="20" fill="#b8dbff" stroke="black" stroke-width="1" stroke-linecap="square"/>
        <text y="-30" x="1120" alignment-baseline="middle">Spanish</text>

    </xsl:template>
</xsl:stylesheet>
