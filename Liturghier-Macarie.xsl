<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
                xmlns="http://www.w3.org/1999/xhtml" 
                expand-text="yes" 
                version="3.0">
  <xsl:output method="xhtml" html-version="5.0" omit-xml-declaration="no" include-content-type="no" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
        <xsl:call-template name="divcentral"></xsl:call-template>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="/text/body/div" name="divcentral" mode="divcentral">
    <header class="text-center">
      <img src="img/frontispiciu_001.png" alt="Frontispiciul din deschiderea Liturghierului" height="500"/>
    </header>
  </xsl:template>
  <xsl:template match="text()|@*" mode="divcentral"/>

  <!-- Suppress TEI notes that are placeholders for medio-bulgar text -->
  <xsl:template match="note[normalize-space(.) = 'Aici va sta textul în medio-bulgară']"/>

</xsl:stylesheet>