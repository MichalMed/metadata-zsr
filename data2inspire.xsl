<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <!-- copies all elements that are not namely changed -->
    <xsl:template match="node()">
        <xsl:copy>
            <!-- copy all attributes and elements -->
            <xsl:namespace name="gmx">http://www.isotc211.org/2005/gmx</xsl:namespace>
            <xsl:namespace name="xlink">http://www.w3.org/1999/xlink</xsl:namespace>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="gmd:MD_LegalConstraints[gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue = 'otherRestrictions' and gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue = 'license']">
        <xsl:copy>
            <xsl:apply-templates/>
            <gmd:otherConstraints>
                <xsl:element name="gmx:Anchor">
                    <xsl:attribute name="xlink:href"
                        >http://inspire.ec.europa.eu/metadata-codelist/LimitationsOnPublicAccess/INSPIRE_Directive_Article13_1d</xsl:attribute>
                    Geobasisinformationen werden auf Antrag übermittelt, soweit nicht eine
                    Rechtsvorschrift eine Übermittlung oder Veröffentlichung von Amts wegen
                    vorschreibt. Angaben zu den Grundstückseigentümern und Erbbauberechtigten dürfen
                    übermittelt werden, wenn der Empfänger ein berechtigtes Interesse an der
                    Kenntnis dieser Informationen darlegt. Der Darlegung eines berechtigten
                    Interesses bedarf es nicht zur Übermittlung an öffentliche Stellen. Der
                    Empfänger hat den Zweck der Verwendung der Geobasisinformationen der
                    Vermessungsbehörde auf Verlangen anzuzeigen. Er darf die Geobasisinformationen
                    insbesondere nur zu dem Zweck verwenden, zu dem sie ihm übermittelt worden sind.
                </xsl:element>
            </gmd:otherConstraints>
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="gmd:resourceConstraints/gmd:MD_LegalConstraints[gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue = 'otherRestrictions' and gmd:otherConstraints/gco:CharacterString = 'neznáme podmienky']">
        <xsl:copy>
            <xsl:element name="gmd:accessConstraints">
                <xsl:element name="gmd:MD_RestrictionCode">
                    <xsl:attribute name="codeList">http://standards.iso.org/iso/19139/resources/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                    <xsl:attribute name="codeListValue">otherRestrictions</xsl:attribute>
                    otherRestrictions
                </xsl:element>
            </xsl:element>            
            <xsl:element name="gmd:otherConstraints">
               <xsl:element name="gmx:Anchor">
                   <xsl:attribute name="xlink:href">http://inspire.ec.europa.eu/metadata-codelist/LimitationsOnPublicAccess/noLimitations</xsl:attribute>
                   neznámé podmienky
               </xsl:element>
            </xsl:element>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
