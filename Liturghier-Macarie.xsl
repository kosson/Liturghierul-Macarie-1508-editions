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

    <xsl:template match="/" mode="#all">
        <!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <!--THIS FILE IS GENERATED FROM AN XML MASTER. DO NOT EDIT (5)-->
            <title>Liturghierul lui Macarie</title>
            <meta name="author" content="Macarie"/>
            <meta name="generator" content="Text Encoding Initiative Consortium XSLT stylesheets"/>
            <meta name="DC.Title" content="Liturghierul lui Macarie"/>
            <meta name="DC.Type" content="Text"/>
            <meta name="DC.Format" content="text/html"/>
            <link href="https://www.tei-c.org/release/xml/tei/stylesheet/tei.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" media="print" type="text/css" href="https://www.tei-c.org/release/xml/tei/stylesheet/tei-print.css"/>
          </head>
          <body>
            <h1>Liturghierul</h1>
            <xsl:for-each select="/TEI/text/body/div/pb">
              <article>
                <xsl:value-of select="@facs"/>
                <xsl:value-of select="."/>
              </article>
            </xsl:for-each>
          </body>
        </html>
    </xsl:template>
</xsl:stylesheet>