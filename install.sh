#!/usr/bin/env bash
# Копіює скіли в ~/.claude/skills/.
# ./install.sh                  усі групи, крім hyperframes
# ./install.sh design video     лише вибрані групи
# Групи: design marketing writing knowledge linkedin video hyperframes
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$DEST"

groups=("$@")
[ ${#groups[@]} -eq 0 ] && groups=(design marketing writing knowledge linkedin video)

dirs_for() {
  case "$1" in
    design)      find "$ROOT/skills/design" -mindepth 1 -maxdepth 1 -type d ! -name _licenses ;;
    marketing)   find "$ROOT/skills/marketing" -mindepth 2 -maxdepth 2 -type d ;;
    writing)     echo "$ROOT/skills/writing/humanizer" ;;
    knowledge)   echo "$ROOT/skills/knowledge/book-to-skill" ;;
    linkedin)    find "$ROOT/skills/linkedin/linkedin-agent-skill/skills" -mindepth 1 -maxdepth 1 -type d ;;
    video)       echo "$ROOT/skills/video/video-craft" ;;
    hyperframes) find "$ROOT/skills/video/hyperframes/skills" -mindepth 1 -maxdepth 1 -type d ;;
    *) echo "Невідома група: $1" >&2; exit 1 ;;
  esac
}

for g in "${groups[@]}"; do
  while IFS= read -r d; do
    [ -f "$d/SKILL.md" ] || continue
    name="$(basename "$d")"
    if [ -e "$DEST/$name" ]; then
      echo "пропускаю $name (вже є в $DEST)"
      continue
    fi
    cp -r "$d" "$DEST/$name"
    echo "+ $name"
  done < <(dirs_for "$g")
done

echo "Готово. Скіли в $DEST. Перезапусти Claude Code."
