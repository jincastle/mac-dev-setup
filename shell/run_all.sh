#!/bin/bash
# =========================================
# shell: 셸 환경 전체 실행 (setup.sh → setup_iterm_theme.sh)
# =========================================
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ">>> [shell] 셸 환경 설치"
./setup.sh
./setup_iterm_theme.sh
echo ">>> [shell] 완료"
