#!/bin/bash
# =========================================
# 00_Setup 종합 실행
# shell → dev → vscode 순서로 전체 셋업
# =========================================

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"

# 하위 스크립트 실행 권한 부여
chmod +x "$ROOT/shell"/*.sh "$ROOT/dev"/*.sh "$ROOT/vscode"/*.sh 2>/dev/null || true

echo "========================================="
echo "00_Setup 전체 실행"
echo "========================================="

echo ""
echo ">>> [1/3] shell (셸/터미널 환경)"
"$ROOT/shell/run_all.sh"

echo ""
echo ">>> [2/3] dev (개발 도구)"
"$ROOT/dev/run_all.sh"

echo ""
echo ">>> [3/3] vscode (확장 + settings.json)"
"$ROOT/vscode/run_all.sh"

echo ""
echo "========================================="
echo "전체 셋업 완료"
echo "  - iTerm2 재시작 후 p10k configure 실행"
echo "========================================="
