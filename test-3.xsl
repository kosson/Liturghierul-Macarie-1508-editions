<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" html-version="5" omit-xml-declaration="yes" indent="yes"/>

    <!-- Entry: produce full HTML page -->
    <xsl:template match="/">
        <html xml:lang="ro" lang="ro">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Liturghierul lui Macarie (1508)</title>
                <link rel="stylesheet" href="css/bootstrap.min.css"/>
                <link rel="stylesheet" href="css/liturghierm.css"/>
                <script src="js/bootstrap.min.js"></script>
            </head>
            <body class="simple" id="TOP">
                <xsl:call-template name="frontispiciu"/>
                <xsl:call-template name="show-scans"/>
                <xsl:call-template name="toc"/>
                <div class="content">
                    <xsl:apply-templates select="tei:TEI/tei:text"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- frontispice notes -->
    <xsl:template name="frontispiciu">
        <xsl:for-each select="tei:TEI/tei:facsimile/tei:surface/tei:zone[tei:note]">
            <div class="frontispiciu">
                <xsl:apply-templates select="tei:note"/>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- show facsimile images -->
    <xsl:template name="show-scans">
        <div class="facsimile">
            <xsl:for-each select="tei:TEI/tei:facsimile/tei:surface">
                <div class="surface">
                    <xsl:if test="tei:graphic">
                        <img src="{tei:graphic/@url}" alt="{tei:graphic/@xml:id}"/>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- Hierarchical TOC: include all tei:head entries and indicate depth by ancestor div count -->
    <xsl:template name="toc">
        <nav class="toc">
            <h3>Cuprins</h3>
            <ul>
                <xsl:for-each select="//tei:head">
                    <xsl:variable name="depth" select="count(ancestor::tei:div)"/>
                        <li>
                            <xsl:attribute name="class">
                                <xsl:text>toc-level-</xsl:text><xsl:value-of select="$depth"/>
                            </xsl:attribute>
                            <xsl:variable name="target" select="(ancestor::tei:div[@type='page'][1]/@xml:id, if(@xml:id) then @xml:id else generate-id(.))[1]"/>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:text>#</xsl:text>
                                    <xsl:value-of select="$target"/>
                                </xsl:attribute>
                                <xsl:value-of select="normalize-space(.)"/>
                            </a>
                        </li>
                </xsl:for-each>
            </ul>
        </nav>
    </xsl:template>

    <!-- TEI text/body mapping -->
    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:body">
        <div class="edition-body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- Pages: create section with id (page id or generated) -->
    <xsl:template match="tei:div[@type='page']">
        <section class="page" id="{@xml:id}">
            <xsl:apply-templates/>
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
    </xsl:template>

    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- Ensure heads have stable ids: use existing @xml:id or generated id -->
    <xsl:template match="tei:head">
        <xsl:variable name="id" select="if(@xml:id) then @xml:id else generate-id(.)"/>
        <h2 id="{@id}">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:figure">
        <figure>
            <xsl:if test="tei:head"><figcaption><xsl:apply-templates select="tei:head"/></figcaption></xsl:if>
            <xsl:if test="tei:figDesc"><figcaption><xsl:apply-templates select="tei:figDesc"/></figcaption></xsl:if>
            <xsl:if test="tei:graphic">
                <img src="{tei:graphic/@url}" alt="{tei:graphic/@xml:id}"/>
            </xsl:if>
        </figure>
    </xsl:template>

    <!-- apparatus preference -->
    <xsl:template match="tei:app">
        <div class="apparatus">
            <xsl:choose>
                <xsl:when test="tei:rdg[@wit='#L2008']">
                    <xsl:apply-templates select="tei:rdg[@wit='#L2008']"/>
                </xsl:when>
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
        <div class="reading"><xsl:apply-templates/></div>
    </xsl:template>

    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
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

    <xsl:template match="tei:lb"><br/></xsl:template>

    <xsl:template match="tei:*">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
