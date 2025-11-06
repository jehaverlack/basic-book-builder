#!/usr/bin/env bash
set -e

REQ_PKGS=(
  make
  pandoc
  texlive
  texlive-xetex
  texlive-latex-extra
  texlive-fonts-recommended
  texlive-fonts-extra
  lmodern
  epubcheck
)

echo "==> Checking and installing build dependencies"

install_pkg() {
  PKG="$1"
  if dpkg -s "$PKG" >/dev/null 2>&1; then
    echo "   ✅ $PKG already installed"
  else
    echo "   ➕ Installing $PKG"
    sudo apt-get install -y "$PKG"
  fi
}

echo "==> Updating package index"
sudo apt-get update -y

for PKG in "${REQ_PKGS[@]}"; do
  install_pkg "$PKG"
done

echo ""
echo "==> Verifying MathJax directory..."
if [ -d "lib/mathjax" ]; then
  echo "   ✅ MathJax directory exists"
else
  echo "   ❌ MathJax directory missing!"
  echo "   Please restore lib/mathjax/ or re-clone repo"
  exit 1
fi

echo ""
echo "🎉 Build environment ready."
echo "Try building with:"
echo "  make pdf"
echo "  make html"
echo "  make epub"
echo ""
