#!/bin/bash
# =========================================
# Development Tools Setup
# Rectangle / Python / uv / Node / Java / VSCode / Cursor / Git / gh / Docker / PostgreSQL / Redis
# =========================================

echo "========================================="
echo "Development Tools Setup"
echo "========================================="

# 창 조절
echo "[1/11] Rectangle..."
brew install --cask rectangle

# Python
echo "[2/11] Python..."
brew install python
python3 --version

# uv
echo "[3/11] uv..."
brew install uv
uv --version

# Node.js
echo "[4/11] Node.js..."
brew install node
node -v
npm -v

# Java
echo "[5/11] OpenJDK..."
brew install openjdk
java -version 2>&1 | head -1

# 에디터
echo "[6/11] Visual Studio Code..."
brew install --cask visual-studio-code

echo "[7/11] Cursor..."
brew install --cask cursor

# Git
echo "[8/11] Git & GitHub CLI..."
brew install git gh
git --version
gh --version

# 인프라
echo "[9/11] Docker..."
brew install --cask docker

echo "[10/11] PostgreSQL..."
brew install postgresql

echo "[11/11] Redis..."
brew install redis

# 설치 확인
echo "========================================="
echo "Installation Check"
echo "========================================="
python3 --version
uv --version
node -v
npm -v
java -version 2>&1 | head -1
git --version
gh --version

echo "========================================="
echo "GitHub Login (optional)"
echo "========================================="
gh auth login

echo "========================================="
echo "Setup Complete"
echo "========================================="
