#!/bin/bash

# set -e

# echo "=== Building PDF ==="
# pandoc --defaults=pandoc.yaml -o build/Paths-to-Perception.pdf

# echo "=== Building EPUB ==="
# pandoc --defaults=pandoc.yaml \
# #   --mathjax \
#   -t epub \
#   --epub-cover-image=lib/img/Revolving_circles.480x480_white.png \
#   -o build/Paths-to-Perception.epub

# echo "=== Building HTML ==="
# pandoc --defaults=pandoc.yaml \
# #   --mathjax \
#   -t html5 \
#   -s \
#   -o build/Paths-to-Perception.html

# echo "=== Done ==="

# # Open PDF automatically if on macOS
# if command -v open >/dev/null; then
#   open build/Paths-to-Perception.pdf
# fi


set -e

echo "=== PDF ==="
pandoc --defaults=conf/pandoc.yaml --defaults=conf/pdf.yaml

echo "=== EPUB ==="
pandoc --defaults=conf/pandoc.yaml --defaults=conf/epub.yaml \
  --epub-cover-image=lib/img/Revolving_circles.480x480_white.png

echo "=== HTML ==="
pandoc --defaults=conf/pandoc.yaml --defaults=conf/html.yaml

echo "✅ All formats built in ./build"
