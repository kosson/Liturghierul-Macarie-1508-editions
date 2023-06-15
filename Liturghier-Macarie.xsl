<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
                xmlns="http://www.w3.org/1999/xhtml" 
                exclude-result-prefixes="#all" 
                expand-text="yes" 
                version="3.0">
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no" indent="yes"/>
  <xsl:mode on-no-match="shallow-copy"/>

  <!-- contruiește întreaga pagina -->
  <xsl:template match="/" mode="#all">
      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ro" lang="ro">
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <!--THIS FILE IS GENERATED FROM AN XML MASTER. DO NOT EDIT (5)-->
          <title>Liturghierul lui Macarie (1508)</title>
          <meta name="author" content="Macarie"/>
          <meta name="generator" content="Text Encoding Initiative Consortium XSLT stylesheets"/>
          <meta name="DC.Title" content="Liturghierul lui Macarie"/>
          <meta name="DC.Type" content="Text"/>
          <meta name="DC.Format" content="text/html"/>
          <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
          <link rel="stylesheet" type="text/css" href="css/liturghierm.css"/>
          <script src="js/bootstrap.min.js"></script>
        </head>
        <body class="simple" id="TOP">
          <!-- <xsl:apply-templates select="/TEI/text/body/div" mode="div unit"/>       -->
          <!-- <xsl:apply-templates/> -->
          <xsl:call-template name="frontispiciu"></xsl:call-template>
          <xsl:call-template name="show-scans">
            <xsl:with-param name="graphics" select="$graphics"/>
          </xsl:call-template>
        </body>
      </html>
  </xsl:template>

  <!-- toate imaginile scanate -->
  <xsl:variable name="graphics" select="//graphic//@url"/>

  <!-- template pentru afișarea imaginilor timbru -->
  <xsl:template name="show-scans">
    <xsl:param name="graphics"/>
    <!-- Creează o secțiune pentru afișarea imaginilor -->
    <section class="row">
    <xsl:for-each select="$graphics">
      <xsl:text>img src="</xsl:text><xsl:value-of select="."/><xsl:text>" /></xsl:text>
    </xsl:for-each>
    </section>
  </xsl:template>


  <!-- header -->
  <xsl:template name="frontispiciu" match="/TEI/teiHeader">
    <header class="text-center">
      <img src="img/frontispiciu_001.png" alt="Frontispiciul din deschiderea Liturghierului" height="500"/>
    </header>
  </xsl:template>

  <!-- div (unitatea) -->
  <xsl:template match="/TEI/text/body/div/div" mode="div unit">
      <div class="container text-center">
        <section class="row">
          <div class="col-sm-4">
            <img src="img/scans/0003.png" height="100"/>
          </div>
          <div class="col-sm-8">
            <xsl:apply-templates/>        
          </div>
        </section>
      </div>       
  </xsl:template>
  




  <!-- app -->
  <xsl:template match="title">

  </xsl:template>
  
  <!-- p -->
  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- lem -->
  <xsl:template match="*[@wit]">
    <h1>
      <h5>@wit</h5>
      <xsl:value-of select="count(//TEI/text/body/div/div/app/lem/@wit)" />
    </h1>
  </xsl:template>

  <xsl:template match="/TEI/text/body/div/div">
    <section class="px-4 pt-5 my-5 text-center border-bottom">
      <!-- <h1 class="display-4 fw-bold text-body-emphasis">Centered screenshot</h1> -->
      <xsl:apply-templates/>
    </section>
  </xsl:template>
</xsl:stylesheet>