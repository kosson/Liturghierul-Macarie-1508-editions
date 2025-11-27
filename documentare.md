## XPath Notebooks for Visual Studio Code

XPath Notebooks for Visual Studio Code: https://www.youtube.com/watch?v=S6VHQNruZfw

Instalează extensia XPath Notebook for Visual Studio Code de la https://marketplace.visualstudio.com/items?itemName=deltaxml.xpath-notebook

## Utilizarea depozitului Github pentru TEI

https://tei-c.org/guidelines/p5/using-the-tei-github-repository/

## TEI Wiki

https://wiki.tei-c.org/index.php?title=Main_Page

## TEI XSL Stylesheets - https://github.com/TEIC/Stylesheets

Acesta este un repo care cuprinde o suită de stylesheet-uri XSLT 2.0 care pot fi folosite pentru a transforma documente TEI în diferite formate.

XSLT este un format XML care implementează XPath pentru a accesa datele documentului principal. Acest lucru înseamnă că la momentul transformării datelor din `Liturghier-Macarie.xml` într-un format dorit, fișierul XSLT va căuta fragmentele de date pe care le dorești transformate folosind expresii XPath. Elementul rădăcină este `<xsl:stylesheet>` care va include un element `<xsl:template>`.

## Pachet de transformare în Debian

https://packages.tei-c.org/deb/

Utilizare: https://tei-c.org/release/doc/tei-xsl/

https://tei-c.org/release/doc/tei-xsl/profiles/default/html/to.html

## Ce sunt edițiile digitale - mică bibliografie

https://books.openbookpublishers.com/10.11647/obp.0095/ch2.xhtml

## Detalii de codare

Deoarece *Liturghierul* are o importanță crucială pentru cultura scrisă a românilor și întregul spațiu ortodox balcanic, pentru că este nu numai un obiect de patrimoniu, ci și un instrument de cult viu, eforturile de codare s-au sprijinit pe îndrumările de la [P5: Guidelines for Electronic Text Encoding and Interchange, Critical Apparatus](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html).

Conform documentației TEI de la [Digital Facsimiles](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html#PHFAX) în acest proiect vom lucra cu un set de reprezentări digitale ale originalului (*digital facsimile*) pe care dorim să-l învestim cu o valoare suplimentară în sfera digitală.
Din acest motiv, fiecare pagină delimitată în `<text>` are un argument `facs` (*facsimile*) atașat elementului `pb` (*page begining*) care face legătura dintre facsimilul digital și pagina codată. În unele cazuri, așa cum este și prima pagină a *Liturgierului* în pagina scanată sunt mai multe elemente grafice. Acestea au fost individualizate folosind `<facsimile>` în care fiecare detaliu a fost tratat ca un `<surface>` ce găzduiește zonele din imagine individualizate prin elemente `<graphic>`.

Modulul pentru realizarea de aparate critice permite codarea diferitelor variante. Efortul de codare a *Liturghierului* poate fi considerat un posibil moment de inițiere a unei ediții critice care să atragă contribuțiile specialiștilor.

Pentru că avem mai multe etape de transformare a textului în timp, am ales codarea folosind `<app>` (*apparatus entry*), care conform TEI oferă posibilitatea de a introduce o intrare în aparatul critic. Pentru `<lem>` (*lemma*) rezervăm textul în medio-bulgară care va fi adăugat pe măsură ce efortul de transliterare va progresa. Pentru variantele textului, așa cum este și varianta din 2009, am ales codarea folosind `<rdg>` (*reading*). Atributul `wit` menționează care sunt reperele variantelor (*witnesess*) de text care sunt incluse în această variantă digitală critică. În loc de repere, le vom numi `martori` pentru a ne apropia de versiunea tehnică recomandată de TEI.

Letrinele au fost și ele marcate prin menționarea făcută cu ajutorul elementului `witDetail` pentru care s-a menționat martorul corespondent ediției în care au apărut sau în care au fost menținute.

În cazul în care părți ale textului apar pe o singură linie, care din motive de opțiune tipografică sau prin însemnătate au fost separate de corpul principal, acestea au fost marcate folosind `<l>` (*line*).

## Detalii de transformare XSLT

Rulează comanda de mai jos pentru a instala pachetul necesar rulării XSLT 2.0 în mediul tău local: `npm install --save-dev xslt3`.
Pentru a realiza transformarea XSLT 2.0 în HTML, rulează comanda de mai jos în terminal din directorul rădăcină al proiectului:

```bash
npm run xslt3:transform
```

Poți genera un rezultat folosind comanda: `npx xslt3 -s:liturghier.xml -xsl:test-3.xsl -o:ultimul2.html`. Această versiune este cea simplificată.

Ultima versiune este `npx xslt3 -s:liturghier.xml -xsl:test-target.xsl -o:target_generated.html`.

## În loc de încheiere

Acest demers și-a propus inițierea efortului de realizare a unor ediții digitale ale primei cărți tipărite din spațiul românesc medieval. Codarea a împrumutat elemente care sunt folosite în mod obișnuit la manuscrise, dar și elemente care sunt folosite pentru codarea primelor tipărituri.