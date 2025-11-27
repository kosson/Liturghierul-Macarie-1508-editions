<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" html-version="5" omit-xml-declaration="yes" indent="yes"/>

    
    <!-- show scans / facsimile images -->
    <xsl:template name="show-scans">
        <div class="facsimile">
            <xsl:for-each select="/tei:TEI/tei:facsimile/tei:surface">
                <div class="surface">
                    <xsl:if test="tei:graphic">
                        <img src="{tei:graphic/@url}" alt="{tei:graphic/@xml:id}" />
                    </xsl:if>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- simple frontispice extraction (notes on zones) -->
    <xsl:template name="frontispiciu">
        <div class="frontispiciu">
            <xsl:for-each select="/tei:TEI/tei:facsimile/tei:surface/tei:zone">
                <xsl:if test="tei:note">
                    <div class="zone-note">
                        <xsl:apply-templates select="tei:note"/>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- Structure mapping: text -> body, div (pages) -> sections -->
    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Table of Contents generated from page heads -->
    <xsl:template name="toc">
        <nav class="toc">
            <h3>Cuprins</h3>
            <ul>
                <xsl:for-each select="/tei:TEI/tei:text/tei:body//tei:div[@type='page'][tei:head]">
                    <li>
                        <a href="#{@xml:id}">
                            <xsl:value-of select="normalize-space(tei:head)"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </nav>
    </xsl:template>

    <xsl:template match="tei:body">
        <div class="edition-body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="@type='page'">
                <section class="page">
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                    <!-- prev/next navigation for pages -->
                    <xsl:variable name="prev" select="preceding-sibling::tei:div[@type='page'][1]/@xml:id"/>
                    <xsl:variable name="next" select="following-sibling::tei:div[@type='page'][1]/@xml:id"/>
                    <nav class="page-nav">
                        <xsl:if test="$prev">
                            <a class="prev" href="#{$prev}">« Pagina anterioară</a>
                        </xsl:if>
                        <xsl:if test="$next">
                            <a class="next" href="#{$next}">Pagina următoare »</a>
                        </xsl:if>
                    </nav>
                </section>
            </xsl:when>
            <xsl:otherwise>
                <div>
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- page break / pointer to facsimile -->
    <xsl:template match="tei:pb">
        <a class="page-anchor" id="{@n}"></a>
    </xsl:template>

    <!-- headings -->
    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <!-- figure with optional graphic and description -->
    <xsl:template match="tei:figure">
        <figure>
            <xsl:if test="tei:head"><figcaption><xsl:apply-templates select="tei:head"/></figcaption></xsl:if>
            <xsl:if test="tei:figDesc"><figcaption><xsl:apply-templates select="tei:figDesc"/></figcaption></xsl:if>
            <xsl:if test="tei:graphic">
                <img src="{tei:graphic/@url}" alt="{tei:graphic/@xml:id}"/>
            </xsl:if>
        </figure>
    </xsl:template>

    <!-- apparatus: prefer readings (rdg) when present, otherwise lemma -->
    <xsl:template match="tei:app">
        <div class="apparatus">
            <xsl:choose>
                <!-- prefer the modern Romanian witness when present -->
                <xsl:when test="tei:rdg[@wit='#L2008']">
                    <xsl:apply-templates select="tei:rdg[@wit='#L2008']"/>
                </xsl:when>
                <!-- otherwise take the first reading if available -->
                <xsl:when test="tei:rdg">
                    <xsl:apply-templates select="tei:rdg[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="tei:lem"/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

    <xsl:template match="tei:rdg | tei:lem">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:note">
        <span class="note"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:seg">
        <span class="seg">
            <xsl:if test="@ana"><xsl:attribute name="data-ana"><xsl:value-of select="@ana"/></xsl:attribute></xsl:if>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <!-- fallback for any TEI element: descend -->
    <xsl:template match="tei:*">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- text nodes output as-is -->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>