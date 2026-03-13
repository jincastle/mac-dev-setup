#!/bin/bash
# =========================================
# dev: 개발 도구 전체 실행
# =========================================
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ">>> [dev] 개발 도구 설치"
./setup_dev_tools.sh
echo ">>> [dev] 완료"
