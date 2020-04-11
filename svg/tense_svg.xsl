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
    <xsl:variable name="maxHeight" as="xs:double" select="100"/>
    <xsl:variable name="yScale" as="xs:double" select="10"/>


    <!-- DOCUMENT TEMPLATE -->
    <xsl:template match="/">
        <svg width="2500" height="2000">
            <g transform="translate(150, 1150)">

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
                <text x="{$maxWidth div 2}" y="{5 * $yScale}" text-anchor="middle"
                    font-size="larger">Tenses</text>
                <text x="-50" y="-{$maxHeight * $yScale div 2}" writing-mode="tb"
                    text-anchor="middle" font-size="larger">Occurrences</text>
                <text x="{$maxWidth div 2}" y="{$maxHeight - 1150}"
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
       <!-- <xsl:variable name="latin_preterite" select="count(book/excerpt/body/line/verb[@tense eq 'preterite'])"
            as="xs:double"/>-->
       <!-- <xsl:variable name="latin_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>-->
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
        <xsl:variable name="latin_futureperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'future perfect'])" as="xs:double"/>
        <xsl:variable name="latin_conditional"
            select="count(book/excerpt/body/line/verb[@tense eq 'conditional'])" as="xs:double"/>

        <!-- BARS -->
     <!--   <rect x="{0}" y="-{$yScale * $latin_preterite}" width="{$barWidth}" height="{$latin_preterite * $yScale}"
            fill="blue"/>-->
      <!--  <rect x="{200}" y="-{$yScale * $latin_past}" width="{$barWidth}"
            height="{$latin_past * $yScale}" fill="blue"/>-->
        <rect x="{300}" y="-{$yScale * $latin_present}" width="{$barWidth}"
            height="{$latin_present * $yScale}" fill="blue"/>
        <rect x="{500}" y="-{$yScale * $latin_imperfect}" width="{$barWidth}"
            height="{$latin_imperfect * $yScale}" fill="blue"/>
        <rect x="{660}" y="-{$yScale * $latin_perfect}" width="{$barWidth}"
            height="{$latin_perfect * $yScale}" fill="blue"/>
        <rect x="{740}" y="-{$yScale * $latin_pluperfect}" width="{$barWidth}"
            height="{$latin_pluperfect * $yScale}" fill="blue"/>
        <rect x="{820}" y="-{$yScale * $latin_future}" width="{$barWidth}"
            height="{$latin_future * $yScale}" fill="blue"/>
        <rect x="{1400}" y="-{$yScale * $latin_futureperfect}" width="{$barWidth}"
            height="{$latin_futureperfect * $yScale}" fill="blue"/>
        <rect x="{1600}" y="-{$yScale * $latin_conditional}" width="{$barWidth}"
            height="{$latin_conditional * $yScale}" fill="blue"/>

    </xsl:template>
    <xsl:template match="english">
      <!--  <xsl:variable name="english_preterite" select="count(book/excerpt/body/line/verb[@tense eq 'preterite'])"
            as="xs:double"/>-->
        <xsl:variable name="english_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>
        <xsl:variable name="english_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
        <xsl:variable name="english_imperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'imperfect'])" as="xs:double"/>
        <xsl:variable name="english_perfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'perfect'])" as="xs:double"/>
        <xsl:variable name="english_pluperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'pluperfect'])" as="xs:double"/>
        <xsl:variable name="english_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>
        <xsl:variable name="english_futureperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'future perfect'])" as="xs:double"/>
        <xsl:variable name="english_conditional"
            select="count(book/excerpt/body/line/verb[@tense eq 'conditional'])" as="xs:double"/>

        <!-- BARS -->
     <!--   <rect x="{40}" y="-{$yScale * $english_preterite}" width="{$barWidth}" height="{$english_preterite * $yScale}"
            fill="red"/>-->
        <rect x="{140}" y="-{$yScale * $english_past}" width="{$barWidth}"
            height="{$english_past * $yScale}" fill="red"/>
        <rect x="{340}" y="-{$yScale * $english_present}" width="{$barWidth}"
            height="{$english_present * $yScale}" fill="red"/>
        <rect x="{540}" y="-{$yScale * $english_imperfect}" width="{$barWidth}"
            height="{$english_imperfect * $yScale}" fill="red"/>
        <rect x="{720}" y="-{$yScale * $english_perfect}" width="{$barWidth}"
            height="{$english_perfect * $yScale}" fill="red"/>
        <rect x="{860}" y="-{$yScale * $english_future}" width="{$barWidth}"
            height="{$english_future * $yScale}" fill="red"/>
        <rect x="{1440}" y="-{$yScale * $english_futureperfect}" width="{$barWidth}"
            height="{$english_futureperfect * $yScale}" fill="red"/>
        <rect x="{1640}" y="-{$yScale * $english_conditional}" width="{$barWidth}"
            height="{$english_conditional * $yScale}" fill="red"/>
    </xsl:template>
    
    <xsl:template match="german">
      <!--  <xsl:variable name="german_preterite" select="count(book/excerpt/body/line/verb[@tense eq 'preterite'])"
            as="xs:double"/>-->
        <xsl:variable name="german_past"
            select="count(book/excerpt/body/line/verb[@tense eq 'past'])" as="xs:double"/>
        <xsl:variable name="german_present"
            select="count(book/excerpt/body/line/verb[@tense eq 'present'])" as="xs:double"/>
       <!-- <xsl:variable name="german_imperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'imperfect'])" as="xs:double"/>-->
        <xsl:variable name="german_perfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'perfect'])" as="xs:double"/>
        <xsl:variable name="german_pluperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'pluperfect'])" as="xs:double"/>
        <xsl:variable name="german_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>
        <xsl:variable name="german_futureperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'future perfect'])" as="xs:double"/>
        <xsl:variable name="german_conditional"
            select="count(book/excerpt/body/line/verb[@tense eq 'conditional'])" as="xs:double"/>

        <!-- BARS -->
      <!--  <rect x="{80}" y="-{$yScale * $german_preterite}" width="{$barWidth}" height="{$german_preterite * $yScale}"
            fill="yellow"/>-->
        <rect x="{180}" y="-{$yScale * $german_past}" width="{$barWidth}"
            height="{$german_past * $yScale}" fill="yellow"/>
        <rect x="{380}" y="-{$yScale * $german_present}" width="{$barWidth}"
            height="{$german_present * $yScale}" fill="yellow"/>
       <!-- <rect x="{680}" y="-{$yScale * $german_imperfect}" width="{$barWidth}"
            height="{$german_imperfect * $yScale}" fill="yellow"/>-->
        <rect x="{880}" y="-{$yScale * $german_perfect}" width="{$barWidth}"
            height="{$german_perfect * $yScale}" fill="yellow"/>
        <rect x="{900}" y="-{$yScale * $german_future}" width="{$barWidth}"
            height="{$german_future * $yScale}" fill="yellow"/>
        <rect x="{1480}" y="-{$yScale * $german_futureperfect}" width="{$barWidth}"
      height="{$german_futureperfect * $yScale}" fill="yellow"/>
        <rect x="{1680}" y="-{$yScale * $german_conditional}" width="{$barWidth}"
            height="{$german_conditional * $yScale}" fill="yellow"/>
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
        <xsl:variable name="spanish_perfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'perfect'])" as="xs:double"/>
        <xsl:variable name="spanish_pluperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'pluperfect'])" as="xs:double"/>
        <xsl:variable name="spanish_future"
            select="count(book/excerpt/body/line/verb[@tense eq 'future'])" as="xs:double"/>
        <xsl:variable name="spanish_futureperfect"
            select="count(book/excerpt/body/line/verb[@tense eq 'future perfect'])" as="xs:double"/>
        <xsl:variable name="spanish_conditional"
            select="count(book/excerpt/body/line/verb[@tense eq 'conditional'])" as="xs:double"/>


        <!-- BARS -->
        <rect x="{60}" y="-{$yScale * $spanish_preterite}" width="{$barWidth}" height="{$spanish_preterite * $yScale}"
            fill="green"/>
        <rect x="{220}" y="-{$yScale * $spanish_past}" width="{$barWidth}"
            height="{$spanish_past * $yScale}" fill="green"/>
        <rect x="{420}" y="-{$yScale * $spanish_present}" width="{$barWidth}"
            height="{$spanish_present * $yScale}" fill="green"/>
        <rect x="{580}" y="-{$yScale * $spanish_imperfect}" width="{$barWidth}"
            height="{$spanish_imperfect * $yScale}" fill="green"/>
        <rect x="{920}" y="-{$yScale * $spanish_perfect}" width="{$barWidth}"
            height="{$spanish_perfect * $yScale}" fill="green"/>
        <rect x="{940}" y="-{$yScale * $spanish_future}" width="{$barWidth}"
            height="{$spanish_future * $yScale}" fill="green"/>
        <rect x="{1520}" y="-{$yScale * $spanish_futureperfect}" width="{$barWidth}"
            height="{$spanish_futureperfect * $yScale}" fill="green"/>
        <rect x="{1720}" y="-{$yScale * $spanish_conditional}" width="{$barWidth}"
            height="{$spanish_conditional * $yScale}" fill="green"/>


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
            <xsl:value-of select="'Future'"/>

    </xsl:template>
</xsl:stylesheet>
