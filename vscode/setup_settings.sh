#!/bin/bash
# =========================================
# VSCode settings.json 자동 적용
# 대상: ~/Library/Application Support/Code/User/settings.json
# =========================================

VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
SETTINGS_FILE="$VSCODE_USER_DIR/settings.json"

mkdir -p "$VSCODE_USER_DIR"

if [ -f "$SETTINGS_FILE" ]; then
  cp "$SETTINGS_FILE" "${SETTINGS_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
  echo "기존 설정 백업 완료."
fi

cat > "$SETTINGS_FILE" << 'SETTINGS_EOF'
{
  // 저장 시 포맷 실행
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.defaultFormatter": "esbenp.prettier-vscode",

  // 일정 시간 후 자동 저장
  "files.autoSave": "afterDelay",

  // Python 인터프리터 (프로젝트 .venv 우선)
  "python.defaultInterpreterPath": ".venv/bin/python",

  // 저장 시 자동 실행할 코드 액션
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true,
    "source.organizeImports": true
  },

  // ESLint 검사 대상 언어
  "eslint.validate": ["javascript", "typescript", "javascriptreact", "typescriptreact"],

  // Prettier 스타일
  "prettier.singleQuote": true,
  "prettier.semi": false,

  // Git 원격 자동 fetch
  "git.autofetch": true,

  // 기본 터미널 프로필 (macOS)
  "terminal.integrated.defaultProfile.osx": "zsh",

  // 내장 터미널 폰트 (아이콘 정상 표시; Cursor는 "MesloLGS NF" 인식 잘 함)
  "terminal.integrated.fontFamily": "MesloLGS NF, MesloLGS Nerd Font Mono",

  // 에디터+터미널 색 테마 (선택)
  "workbench.colorTheme": "Dracula"
}
SETTINGS_EOF

echo "settings.json 적용 완료: $SETTINGS_FILE"

# Cursor에도 동일 설정 적용 (폴더 없으면 생성 후 기록)
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
CURSOR_SETTINGS="$CURSOR_USER_DIR/settings.json"
mkdir -p "$CURSOR_USER_DIR"
if [ -f "$CURSOR_SETTINGS" ]; then
  cp "$CURSOR_SETTINGS" "${CURSOR_SETTINGS}.backup.$(date +%Y%m%d_%H%M%S)"
fi
cat > "$CURSOR_SETTINGS" << 'CURSOR_SETTINGS_EOF'
{
  // Cursor에는 폰트 설정만 적용
  "terminal.integrated.fontFamily": "MesloLGS NF, MesloLGS Nerd Font Mono"
}
CURSOR_SETTINGS_EOF

echo "Cursor settings.json 적용: $CURSOR_SETTINGS"

echo "VSCode/Cursor를 다시 열거나 창을 새로고침하면 적용됩니다."
