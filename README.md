# DocuSeal aux couleurs de Calyzo

Calyzo utilise [DocuSeal](https://github.com/docusealco/docuseal) (AGPL-3.0) sans en changer le code, à une exception près : les couleurs de son interface. Ce dépôt publie cette modification, comme le demande la licence.

- **Le logiciel :** l'image officielle `docuseal/docuseal`, sans autre changement. Son code source est dans le dépôt de DocuSeal.
- **La modification :** [`appliquer.sh`](appliquer.sh), lancé au démarrage du conteneur, ajoute un bloc de variables de couleur aux feuilles de style.
- **La mise en place :** le dossier de ce script est monté sur `/theme`, et le conteneur démarre par :

```yaml
command: ['sh', '-c', 'sh /theme/appliquer.sh; exec /app/bin/bundle exec puma -C /app/config/puma.rb --dir /app']
```

La mention de DocuSeal reste affichée, conformément aux termes additionnels de sa licence.
