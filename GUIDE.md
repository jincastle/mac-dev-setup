# 00_Setup 가이드

## 디렉터리 구조

| 디렉터리 | 내용 |
|----------|------|
| `shell/` | 셸 환경 (Homebrew, iTerm2, Oh My Zsh, Powerlevel10k, zsh 플러그인, fzf, 폰트/테마) |
| `dev/` | 개발 도구 (Rectangle, Python, uv, Node, Java, VSCode, Cursor, Git, gh, Docker, PostgreSQL, Redis) |
| `vscode/` | VSCode 확장 설치 + settings.json 적용 |

## 한 번에 설치 (종합)

| 명령어 | 설명 |
|--------|------|
| `chmod +x setup_all.sh` | 종합 스크립트 실행 권한 부여 |
| `./setup_all.sh` | shell → dev → vscode 순서로 전체 설치 |

## 카테고리별 실행

| 명령어 | 설명 |
|--------|------|
| `chmod +x shell/run_all.sh && ./shell/run_all.sh` | 셸 환경만 설치 |
| `chmod +x dev/run_all.sh && ./dev/run_all.sh` | 개발 도구만 설치 |
| `chmod +x vscode/run_all.sh && ./vscode/run_all.sh` | VSCode 확장·설정만 적용 |

## 개별 스크립트

| 경로 | 설명 |
|------|------|
| `shell/setup.sh` | Homebrew, iTerm2, Oh My Zsh, Powerlevel10k, zsh 플러그인, fzf |
| `shell/setup_iterm_theme.sh` | MesloLGS Nerd Font + Dracula 테마 |
| `dev/setup_dev_tools.sh` | Rectangle, Python, uv, Node, Java, VSCode, Cursor, Git, gh, Docker, PostgreSQL, Redis |
| `vscode/install_extensions.sh` | VSCode 확장 패키지 설치 |
| `vscode/setup_settings.sh` | settings.json 자동 적용 |

## 기타

| 명령어 | 설명 |
|--------|------|
| `p10k configure` | Powerlevel10k 테마 설정 (설치 후 1회) |

## 참고

- Mac 진단: https://support.apple.com/ko-kr/102550
- 설치 후 iTerm2 재시작 시 셸 설정 적용됨
- **iTerm 폰트/테마**: Font `MesloLGS Nerd Font Mono`, 테마 `Dracula` → 스크립트 실행 후 iTerm2 Preferences에서 적용, 프롬프트는 `p10k configure`
