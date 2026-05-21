#!/usr/bin/env bash
set -euo pipefail

# Baixa localmente os PDFs do repositório externo sonambhatnagar/inburgering.
# Uso:
#   cd 12-recursos-externos/inburgering-sonambhatnagar
#   bash download_resources.sh

BASE_URL="https://raw.githubusercontent.com/sonambhatnagar/inburgering/main"
OUT_DIR="pdfs"

mkdir -p "$OUT_DIR"

files=(
  "Dutch_Book.pdf"
  "basicgrammer_syll.pdf"
  "vocabulaire.pdf"
  "my_inburgering_notes.pdf"
  "Part_1-80_speaking_questions.pdf"
  "Multiple_Choice_Questions_for_speaking.pdf"
  "KNM_Book(Welkom_in_Nederland).pdf"
  "Oefenexamens_voor_het_KNM_examen.pdf"
)

for file in "${files[@]}"; do
  echo "Downloading $file..."
  curl -L --fail --output "$OUT_DIR/$file" "$BASE_URL/$file"
done

echo "Done. PDFs saved in: $OUT_DIR/"
