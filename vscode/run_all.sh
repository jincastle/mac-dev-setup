#!/bin/bash
# =========================================
# vscode: 확장 설치 → settings.json 적용
# =========================================
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ">>> [vscode] 확장 설치"
./install_extensions.sh
echo ">>> [vscode] settings.json 적용"
./setup_settings.sh
echo ">>> [vscode] 완료"
