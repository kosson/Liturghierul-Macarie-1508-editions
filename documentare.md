## XPath Notebooks for Visual Studio Code

https://www.youtube.com/watch?v=S6VHQNruZfw


## Utilizarea depozitului Github pentru TEI

https://tei-c.org/guidelines/p5/using-the-tei-github-repository/

## TEI Wiki

https://wiki.tei-c.org/index.php?title=Main_Page

## TEI XSL Stylesheets - https://github.com/TEIC/Stylesheets

Acesta este un repo care cuprinde o suită de stypesheet-uri XSLT 2.0 care pot fi folosite pentru a transforma documente TEI în diferite formate.

XSLT este un format XML care implementează XPath pentru a accesa datele documentului principal. Acest lucru înseamnă că la momentul transformării datelor din `Liturghier-Macarie.xml` într-un format dorit, fișierul XSLT va căuta fragmentele de date pe care le dorești transformate folosind expresii XPath. Elementul rădăcină este `<xsl:stylesheet>` care va include un element `<xsl:template>`.
