#!/bin/bash
# =========================================
# VSCode Extensions Install
# =========================================

echo "Installing VSCode Extensions..."

# Python
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension charliermarsh.ruff

# JS/TS & 포맷
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

# Git & Docker
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker

# API & env
code --install-extension humao.rest-client
code --install-extension mikestead.dotenv

# 편의성
code --install-extension christian-kohler.path-intellisense
code --install-extension steoates.autoimport
code --install-extension usernamehw.errorlens
code --install-extension rangav.vscode-thunder-client
code --install-extension gruntfuggly.todo-tree

# 프론트
code --install-extension bradlc.vscode-tailwindcss

# Java
code --install-extension vscjava.vscode-java-pack

echo "All extensions installed."
