#!/usr/bin/env bash
# Usage: scripts/setup-linux-deb.sh
# Description: Installs build dependencies for Debian-based systems (Ubuntu, Zorin, etc.)

set -euo pipefail

echo "🚀 Starting Basic-Book-Builder Setup..."

# 1. Update package lists
sudo apt update

# 2. Install Core Utilities
echo "📦 Installing core utilities (make, jq, yq, etc.)..."
sudo apt install -y make jq yq wget curl tar git

# 3. Install TeX Live Stack
echo "📑 Installing TeX Live stack (this may take a while)..."
sudo apt install -y \
    texlive \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    lmodern

# 4. Install Pandoc (Specific Version)
PANDOC_VER="3.8.2.1"
if ! command -v pandoc &> /dev/null || [[ $(pandoc --version | head -n1) != *"$PANDOC_VER"* ]]; then
    echo "📥 Downloading and installing Pandoc v$PANDOC_VER..."
    PANDOC_DEB="pandoc-$PANDOC_VER-1-amd64.deb"
    wget "https://github.com/jgm/pandoc/releases/download/$PANDOC_VER/$PANDOC_DEB"
    sudo apt install -y "./$PANDOC_DEB"
    rm "$PANDOC_DEB"
else
    echo "✅ Pandoc $PANDOC_VER is already installed."
fi

# 5. MathJax Setup (Local assets for HTML build)
MATHJAX_DIR="lib/mathjax"
if [ ! -d "$MATHJAX_DIR" ]; then
    echo "🔢 Setting up MathJax..."
    mkdir -p "$MATHJAX_DIR"
    wget https://registry.npmjs.org/mathjax/-/mathjax-3.2.2.tgz
    tar xzf mathjax-3.2.2.tgz
    mv package/es5/* "$MATHJAX_DIR/"
    rm -rf package mathjax-3.2.2.tgz
else
    echo "✅ MathJax already present in $MATHJAX_DIR."
fi

# 6. Scaffolding Build Directories
echo "📂 Creating project directory structure..."
mkdir -p build/pdf build/html build/latex build/epub build/md
mkdir -p scripts/tmp
mkdir -p lib/img lib/diag

# 7. Optional Tools (Checks if they are installed, otherwise prompts)
echo "🔍 Checking for optional tools..."
for tool in foliate calibre epubcheck; do
    if ! command -v $tool &> /dev/null; then
        echo "💡 Tip: You might want to 'sudo apt install $tool' for better EPub testing."
    fi
done

echo "---------------------------------------------------"
echo "🎉 Setup Complete!"
echo "👉 To verify your setup, try running: make pdf"