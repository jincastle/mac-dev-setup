#!/bin/bash
# =========================================
# iTerm2 폰트 & Dracula 테마 설치
# - Font: MesloLGS Nerd Font Mono
# - Theme: Dracula
# =========================================

echo "========================================="
echo "iTerm2 폰트 & Dracula 테마 설치"
echo "========================================="

# MesloLGS Nerd Font (Powerlevel10k 권장)
echo "[1/2] MesloLGS Nerd Font 설치..."
brew install --cask font-meslo-lg-nerd-font

# Dracula 테마 클론
DRACULA_DIR="$HOME/.config/iterm/dracula"
if [ ! -d "$DRACULA_DIR" ]; then
  echo "[2/2] Dracula 테마 다운로드..."
  mkdir -p "$(dirname "$DRACULA_DIR")"
  git clone https://github.com/dracula/iterm.git "$DRACULA_DIR"
else
  echo "[2/2] Dracula 테마 이미 존재함."
fi

echo "========================================="
echo "설치 완료"
echo "========================================="
echo "iTerm2에서 적용 방법:"
echo "  1. Preferences (Cmd + ,) → Profiles → Text"
echo "     → Font: MesloLGS Nerd Font Mono 선택"
echo "  2. Preferences → Profiles → Colors"
echo "     → Color Presets → Import → $DRACULA_DIR/Dracula.itermcolors"
echo "     → Color Presets에서 Dracula 선택"
echo "  3. 프롬프트 테마: p10k configure"
echo "========================================="
