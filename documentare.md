## XPath Notebooks for Visual Studio Code

https://www.youtube.com/watch?v=S6VHQNruZfw

## Utilizarea depozitului Github pentru TEI

https://tei-c.org/guidelines/p5/using-the-tei-github-repository/

## TEI Wiki

https://wiki.tei-c.org/index.php?title=Main_Page

## TEI XSL Stylesheets - https://github.com/TEIC/Stylesheets

Acesta este un repo care cuprinde o suită de stylesheet-uri XSLT 2.0 care pot fi folosite pentru a transforma documente TEI în diferite formate.

XSLT este un format XML care implementează XPath pentru a accesa datele documentului principal. Acest lucru înseamnă că la momentul transformării datelor din `Liturghier-Macarie.xml` într-un format dorit, fișierul XSLT va căuta fragmentele de date pe care le dorești transformate folosind expresii XPath. Elementul rădăcină este `<xsl:stylesheet>` care va include un element `<xsl:template>`.

## Detalii de codare

Deoarece *Liturghierul* are o importanță crucială pentru cultura scrisă a românilor și întregul spațiu ortodox balcanic, pentru că este nu numai un obiect de patrimoniu, ci și un instrument de cult viu, eforturile de codare s-au sprijinit pe îndrumările de la [P5: Guidelines for Electronic Text Encoding and Interchange, Critical Apparatus](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html).

Conform documentației TEI de la [Digital Facsimiles](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html#PHFAX) în acest proiect vom lucra cu un set de reprezentări digitale ale originalului (*digital facsimile*) pe care dorim să-l învestim cu o valoare suplimentară în sfera digitală.
Din acest motiv, fiecare pagină delimitată în `<text>` are un argument `facs` (*facsimile*) atașat elementului `pb` (*page begining*) care face legătura dintre facsimilul digital și pagina codată. În unele cazuri, așa cum este și prima pagină a *Liturgierului* în pagina scanată sunt mai multe elemente grafice. Acestea au fost individualizate folosind `<facsimile>` în care fiecare detaliu a fost tratat ca un `<surface>` ce găzduiește zonele din imagine individualizate prin elemente `<graphic>`.

Modulul pentru realizarea de aparate critice permite codarea diferitelor variante. Efortul de codare a *Liturghierului* poate fi considerat un posibil moment de inițiere a unei ediții critice care să atragă contribuțiile specialiștilor.

Pentru că avem mai multe etape de transformare a textului în timp, am ales codarea folosind `<app>` (*apparatus entry*), care conform TEI oferă posibilitatea de a introduce o intrare în aparatul critic. Pentru `<lem>` (*lemma*) rezervăm textul în medio-bulgară care va fi adăugat pe măsură ce efortul de transliterare va progresa. Pentru variantele textului, așa cum este și varianta din 2009, am ales codarea folosind `<rdg>` (*reading*). Atributul `wit` menționează care sunt reperele variantelor (*witnesess*) de text care sunt incluse în această variantă digitală critică. În loc de repere, le vom numi `martori` pentru a ne apropia de versiunea tehnică recomandată de TEI.

Letrinele au fost și ele marcate prin menționarea făcută cu ajutorul elementului `witDetail` pentru care s-a menționat martorul corespondent ediției în care au apărut sau în care au fost menținute.

În cazul în care părți ale textului apar pe o singură linie, care din motive de opțiune tipografică sau prin însemnătate au fost separate de corpul principal, acestea au fost marcate folosind `<l>` (*line*).

## În loc de încheiere

Acest demers și-a propus inițierea efortului de realizare a unor ediții digitale ale primei cărți tipărite din spațiul românesc medieval. Codarea a împrumutat elemente care sunt folosite în mod obișnuit la manuscrise, dar și elemente care sunt folosite pentru codarea primelor tipărituri.