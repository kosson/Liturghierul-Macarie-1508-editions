# Necesar

Acest proiect a fost pornit folosind OxygenXML, dar continuat pe MS Visual Studio Code. Diferența dintre cele două pachete este prețul și câteva funcționalități de care ne putem lipsi în cazul acestui proiect. Descărcați și instalați VS Code de la https://code.visualstudio.com/. VS Code are nevoie să fie suplimentat cu niște extensii care permit lucrul cu partea explicativă și de testare care este un notebook (https://www.youtube.com/watch?v=zulGMYg0v6U sau https://www.youtube.com/watch?v=D-AXZZDTQhM&t=133s pentru mai multe detalii).

Trebuie să aveți instalat NodeJS pentru că primul pas pe care îl veți face atunci când veți deschide acest proiect este să inițiați o sesiune de lucru cu un Terminal/Console în directorul rădăcină al proiectului de unde lansați comanda `npm install`. Vor fi instalate pachetele necesare care sunt specificate în package.json. În câteva secunde se vor instala. Asigură-te că și kernelul de Node.js este instalat pentru a augmenta capabilitățile interpretative ale lui Jupyter notebooks. Pentru a face acest lucru, lansează comanda în Terminal: `npm install -g ijavascript`.

Având deschis VS Code instalează următoarele extensii (*Extensions*):

- Jupyter
- Live Server
- XML (XML Language Support by Red Hat)
- XPath Notebook for Visual Studio Code
- XSLT/XPath for Visual Studio Code
- tei-publisher-vscode
- Scholarly XML

După instalarea extensiei `XSLT/XPath for Visual Studio Code` se va instala și procesorul XSLT prin lansarea în Terminal a comenzii `npm install --save-dev xslt3`.

Urmează toți pașii de aici: https://deltaxml.github.io/vscode-xslt-xpath/run-xslt.html. Contextul în care vei urma pașii este cel în care în subdirectorul `.vscode` nu există fișierul `tasks.json`. Conținutul acestuia trebuie să fie similar cu următorul fragment:

```javascript
{
  "type": "xslt-js",
  "label": "Transformare primara",
  "xsltFile": "${command:xslt-xpath.pickXsltFile}",
  "xmlSource": "${file}",
  "resultPath": "${command:xslt-xpath.pickResultFile}",
  "group": {
      "kind": "build",
      "isDefault": true
  },
  "problemMatcher": [
      "$saxon-xslt-js"
  ]
}
```

Pentru a realiza transformarea se va iniția prin combo-ul `CTRL+SHIFT+B` de unde se va alege opțiunea de transformare menționată în fișierul `tasks.json` la `"label": "Transformare primara"`. În cazul de față, am denumit prima operațiune `Transformare primară` care are drept scop realizarea unui fișier html din sursa xml.


Câteva direcții generale de lucru:

- [Develop and run XSLT 3.0 in Visual Studio Code](https://www.youtube.com/watch?v=fdxfXaJw6SY)
- [XPath Notebooks for Visual Studio Code](https://www.youtube.com/watch?v=S6VHQNruZfw)

TODO: de testat pe Windows!!!
