<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" html-version="5" omit-xml-declaration="yes" indent="yes"/>

  <xsl:template match="/">
    <html xml:lang="ro" lang="ro">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Liturghierul lui Macarie (1508)</title>
        <meta name="author" content="Macarie"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/liturghierm.css"/>
        <script src="js/bootstrap.min.js"></script>
      </head>
      <body id="TOP">
        <header>
          <header id="frontispiciu" class="">
            <img src="img/frontispiciu_001.png" alt=""/>
          </header>
        </header>

        <main class="container bjToTransp">
          <!-- gallery -->
          <section id="galleryhousing" class="text-center">
            <div id="thumbsgallery" class="container">
              <xsl:for-each select="/tei:TEI/tei:facsimile/tei:surface/tei:graphic">
                <img src="{@url}" height="200px"/>
              </xsl:for-each>
            </div>
          </section>

          <!-- pages as articles -->
          <section class="container text-center">
            <xsl:variable name="surfaces" select="/tei:TEI/tei:facsimile/tei:surface"/>
            <xsl:for-each select="/tei:TEI/tei:text/tei:body//tei:div[@type='page']">
              <xsl:variable name="i" select="position()"/>
              <article class="row page">
                <div class="col-sm-2">
                  <div>
                    <p>Pagina <xsl:value-of select="tei:pb[1]/@n"/> din BAR6226</p>
                  </div>
                  <div>
                    <!-- prefer mapping via pb/@facs -> graphic[@xml:id], otherwise fallback to positional surface -->
                    <xsl:variable name="facsId" select="substring-after(tei:pb[1]/@facs,'#')"/>
                    <xsl:variable name="img">
                      <xsl:choose>
                        <xsl:when test="$facsId and /tei:TEI/tei:facsimile/tei:surface/tei:graphic[@xml:id = $facsId]/@url">
                          <xsl:value-of select="/tei:TEI/tei:facsimile/tei:surface/tei:graphic[@xml:id = $facsId]/@url"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$surfaces[$i]/tei:graphic/@url"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    <img class="rounded mx-auto d-block" src="{string($img)}" height="100"/>
                  </div>
                </div>
                <div class="col-sm-8 ink">
                  <h3>
                    <xsl:apply-templates select="tei:head|tei:app/tei:rdg|tei:app/tei:lem"/>
                  </h3>

                  <!-- accordion mapping: for each app produce an accordion with its readings -->
                  <xsl:for-each select="tei:app">
                    <div class="accordion app" id="{concat('p', $i, '_app_', position())}">
                      <xsl:for-each select="(tei:rdg|tei:lem)">
                        <xsl:variable name="wit" select="substring-after(normalize-space(@wit),'#')"/>
                        <xsl:variable name="panelId" select="concat('panel-', $wit, '-', generate-id(.))"/>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="{concat('header-', $panelId)}">
                            <button class="accordion-button{(if(position() ne 1) then ' collapsed' else '')}" type="button" data-bs-toggle="collapse"
                              data-bs-target="{concat('#', $panelId)}" aria-expanded="{(position() = 1)}" aria-controls="{$panelId}">
                              <xsl:value-of select="$wit"/>
                            </button>
                          </h2>
                          <div id="{ $panelId }" class="accordion-collapse collapse{(if(position() = 1) then ' show' else '')}">
                            <div class="accordion-body">
                              <xsl:apply-templates select="."/>
                            </div>
                          </div>
                        </div>
                      </xsl:for-each>
                    </div>
                  </xsl:for-each>
                </div>
                <div class="col-sm-2">
                  <div class="cues">
                    <!-- optional person image: pick first person in standOff list for demo -->
                    <xsl:if test="/tei:TEI/tei:standOff/tei:listPerson/tei:person[1]/tei:persName">
                      <a href="https://ro.wikipedia.org/wiki/Vasile_cel_Mare" target="_blank" rel="noopener noreferrer">
                        <img src="img/persons/Magnus_Basilius.png" alt="Vasile cel Mare"/>
                      </a>
                    </xsl:if>
                  </div>
                </div>
              </article>
            </xsl:for-each>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>

  <!-- basic TEI templates for inline nodes -->
  <xsl:template match="tei:p"><xsl:copy-of select="."/></xsl:template>
  <xsl:template match="tei:lb"><br/></xsl:template>
  <xsl:template match="tei:seg"><span class="seg"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="text()"><xsl:value-of select="normalize-space(.)"/></xsl:template>

</xsl:stylesheet>
