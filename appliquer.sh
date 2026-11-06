#!/bin/sh
# Lancé par le conteneur DocuSeal au démarrage. Cuivre #B65B24, encre #101828, fonds #FBF8F5, #F8F3EF, #EADDD4.
# Un échec ne doit jamais empêcher DocuSeal de démarrer : pas de set -e, et l'appel dans le Compose est suivi de « ; ».
REPERE='/* couleurs Calyzo */'
BLOC=':root:root{--n:22.6 67% 42.7%;--nf:22.4 70.2% 32.9%;--nc:0 0% 100%;--b1:30 42.9% 97.3%;--b2:26.7 39.1% 95.5%;--b3:24.5 34.4% 87.5%;--bc:220 42.9% 11%;--p:24.5 34.4% 87.5%;--pf:24.5 34.4% 80%;--pc:220 42.9% 11%;--s:22.6 67% 42.7%;--sf:22.4 70.2% 32.9%;--sc:0 0% 100%;--a:22.6 67% 42.7%;--af:22.4 70.2% 32.9%;--ac:0 0% 100%}'
for f in /app/public/packs/css/application-*.css /app/public/packs/css/form-*.css; do
  [ -f "$f" ] || { echo "couleurs : $f absent"; continue; }
  grep -qF "$REPERE" "$f" && continue
  printf '\n%s%s\n' "$REPERE" "$BLOC" >> "$f"
  # Les versions compressées d'origine seraient servies à la place du fichier modifié.
  rm -f "$f.br"
  gzip -9 -k -f "$f"
done
echo "couleurs : appliquées"
