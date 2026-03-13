#!/bin/bash
# ========================================
# Mac M1/M2/M3/M4/M5 Developer Environment Setup
# iTerm2, Oh My Zsh, Powerlevel10k, zsh plugins, fzf 설치
# ========================================

set -e

# -----------------------------
# 1️⃣ Homebrew 설치 (없으면 설치)
# -----------------------------
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew 설치 중..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew 이미 설치됨."
fi

# -----------------------------
# 2️⃣ iTerm2 설치
# -----------------------------
echo "iTerm2 설치 중..."
brew install --cask iterm2

# -----------------------------
# 3️⃣ Oh My Zsh 설치 (없으면 설치)
# -----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh 설치 중..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh 이미 설치됨."
fi

# -----------------------------
# 4️⃣ Powerlevel10k 설치
# -----------------------------
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Powerlevel10k 설치 중..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo "Powerlevel10k 이미 설치됨."
fi

# -----------------------------
# 5️⃣ .zshrc 설정
# -----------------------------
ZSHRC="$HOME/.zshrc"

# 테마 설정
if grep -q '^ZSH_THEME=' "$ZSHRC" 2>/dev/null; then
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
else
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
fi

# Powerlevel10k 설정 파일 로드
grep -qxF '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' "$ZSHRC" 2>/dev/null || \
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> "$ZSHRC"

# -----------------------------
# 6️⃣ Brew 기반 zsh plugin 설치
# -----------------------------
echo "Zsh plugin 설치 중..."
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf

# -----------------------------
# 7️⃣ .zshrc에 plugin 로드
# -----------------------------
# autosuggestions
grep -qxF "source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" "$ZSHRC" 2>/dev/null || \
    echo "source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$ZSHRC"

# completions
grep -qxF "fpath+=\$(brew --prefix)/share/zsh-completions" "$ZSHRC" 2>/dev/null || \
    echo "fpath+=\$(brew --prefix)/share/zsh-completions" >> "$ZSHRC"

grep -qxF "autoload -Uz compinit" "$ZSHRC" 2>/dev/null || echo "autoload -Uz compinit" >> "$ZSHRC"
grep -qxF "compinit" "$ZSHRC" 2>/dev/null || echo "compinit" >> "$ZSHRC"

# fzf
grep -qxF "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" "$ZSHRC" 2>/dev/null || \
    echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> "$ZSHRC"

# syntax highlighting (마지막에 로드해야 함)
grep -qxF "source \$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "$ZSHRC" 2>/dev/null || \
    echo "source \$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$ZSHRC"

# -----------------------------
# 8️⃣ fzf key binding 활성화
# -----------------------------
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# -----------------------------
# 9️⃣ 환경 적용
# -----------------------------
echo "환경 적용 중..."
source "$ZSHRC" 2>/dev/null || true

# -----------------------------
# 🔟 Powerlevel10k UI 안내
# -----------------------------
echo ""
echo "=============================================="
echo "✅ 셸 환경 설치 완료!"
echo "Powerlevel10k 테마를 설정하려면: p10k configure"
echo "이후 iTerm2를 재시작하면 UI가 적용됩니다."
echo "=============================================="
