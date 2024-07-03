# Isotope eCommerce Migrationstool

Das Isotope eCommerce Migrationstool kümmert sich um das Update deiner **Isotope eCommerce 1.4.8** 
Datenbank zu Isotope eCommerce 2.2.*. Bitte beachte, dass es im Moment ausschliesslich diesen Update-Pfad 
unterstützt.

- [Documentation in English](docs/en.md)
- [Entwickler-Infos](docs/dev.md)


## Installation

Es gibt zwei verschiedene Installationsmethoden um das Migrationstool benutzen zu können. 
Wähle diejenige, die für dich am besten funktioniert. Für beide gilt, dass nach dem 
Upload der Datei(en) in **das Wurzelverzeichnis deiner Contao-Installation** die erwähnte URL 
aufgerufen werden muss, um das Migrationstool zu starten.

### Phar-Datei

Du kannst die ".phar"-Datei herunterladen, welche das gesamte Migrationstool in einer einzigen 
Datei enthält. Beachte, dass die Ausführung von Phar-Dateien gewisse Anforderungen an den Server 
stellt und möglicherweise für dich nicht funktioniert. In diesem Fall musst du die Installationsmethode
"Reguläres Archiv" nutzen.

**URL für die Ausführung des Migrationstools:** http(s)://deine-domain.tld/name-der-phar-datei.phar.php

[Download](https://github.com/isotope/migration/releases/download/1.0.5/isotope-migration.phar.php.zip)

### Reguläres Archiv

Du kannst das Migrationstool als komprimiertes Archiv herunterladen, entpacken und das gesamte 
Verzeichnis auf den Server laden.

**URL für die Ausführung des Migrationstools:** http(s)://deine-domain.tld/name-des-verzeichnisses/

[Downoad](https://github.com/isotope/migration/releases/download/1.0.5/isotope-migration.zip)


## Migration durchführen

Du stehst nun vor der Migration der Daten deines Online-Shops. Dabei handelt es sich nicht 
um einen trivialen Vorgang und solltest du auf Probleme stossen kann es sein, dass du den ganzen
Prozess erneut starten musst. Backups sind deswegen unerlässlich!

Sobald du das Migrationstool installiert hast, wird es dir alle notwendigen Schritte aufzeigen.
Beachte, dass es zig Dinge gibt, welche das Migrationstool nicht für dich tun kann. Vor allem dann, 
wenn du deine 1.4.8er-Installation stark angepasst hast (viele Template-Änderungen, 
Drittanbieter-Erweiterungen), wird das Update zu einer zeitintensiven Aufgabe! So oder so: Das 
Update von der Version 1.4.8 auf 2.2.* wird kein Kinderspiel!

Wir möchten es nicht unterlassen, an dieser Stelle auf den 
[Isotope eCommerce Circle](https://circle.isotopeecommerce.org) hinzuweisen, 
wo du - als Mitglied - professionellen Support erhalten kannst.
