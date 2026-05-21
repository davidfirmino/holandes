#!/usr/bin/env bash
set -euo pipefail

# Script para adicionar localmente os PDFs enviados pelo chat ao repositório.
#
# Uso esperado:
#   1. Clone o repo:
#      git clone git@github.com:davidfirmino/holandes.git
#      cd holandes
#
#   2. Crie a pasta de destino:
#      mkdir -p 12-recursos-externos/uploaded-pdfs/files
#
#   3. Copie os PDFs baixados do chat para essa pasta.
#
#   4. Rode:
#      bash 12-recursos-externos/uploaded-pdfs/add_uploaded_pdfs_locally.sh
#
# Observação:
# A integração do ChatGPT com GitHub usada aqui não consegue anexar diretamente
# arquivos binários locais grandes. Por isso, este script deixa o processo local
# simples e reproduzível.

TARGET_DIR="12-recursos-externos/uploaded-pdfs/files"

expected_files=(
  "Emailing 195-14-leesteksten-lezen-a1.pdf"
  "Emailing e-book-lesson-1-20-1000DutchWords.pdf"
  "Emailing Inburgeringsexamen A2 (Ad Appel) (z-lib.org).pdf"
  "Oefentoets 1 - Leesvaardigheid A2 - 2022.pdf"
  "Oefentoets 1 - Leesvaardigheid A2 - 2022 (1).pdf"
  "Oefentoets 2 - Leesvaardigheid A2 - 2022.pdf"
  "Oefentoets 3 - Leesvaardigheid A2 - 2022.pdf"
  "Oefentoets 4 - Leesvaardigheid A2 - 2022.pdf"
  "Oefentoets 5 - Leesvaardigheid A2 - 2022.pdf"
)

mkdir -p "$TARGET_DIR"

missing=0
for file in "${expected_files[@]}"; do
  if [[ ! -f "$TARGET_DIR/$file" ]]; then
    echo "MISSING: $TARGET_DIR/$file"
    missing=1
  else
    echo "OK: $TARGET_DIR/$file"
  fi
done

if [[ "$missing" -eq 1 ]]; then
  echo
  echo "Alguns PDFs ainda não estão em $TARGET_DIR."
  echo "Copie os arquivos baixados do chat para essa pasta e rode o script novamente."
  exit 1
fi

git add "$TARGET_DIR" README.md 12-recursos-externos/uploaded-pdfs || true

git status --short

echo
echo "Se estiver tudo certo, rode:"
echo "  git commit -m 'Adiciona PDFs de apoio para Inburgering A2'"
echo "  git push origin main"
