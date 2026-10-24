# Плагіни Claude Code (ставляться командою, не копіюються)

Плагіни живуть у маркетплейсах на GitHub і оновлюються самі, тому тут лише команди. Вводити в Claude Code.

## 1. Додати маркетплейси

```
/plugin marketplace add anthropics/claude-plugins-official
/plugin marketplace add obra/superpowers-marketplace
/plugin marketplace add upstash/context7
/plugin marketplace add anthropics/skills
```

## 2. Поставити плагіни

| Плагін | Команда | Навіщо |
|--------|---------|--------|
| **superpowers** | `/plugin install superpowers@claude-plugins-official` | головний: брейншторм перед роботою, план, TDD, систематичний дебаг, перевірка перед «готово», паралельні агенти |
| superpowers-lab | `/plugin install superpowers-lab@superpowers-marketplace` | експериментальні: пошук дублів функцій, tmux для інтерактивних команд, MCP CLI |
| superpowers-chrome | `/plugin install superpowers-chrome@superpowers-marketplace` | керування Chrome через DevTools Protocol |
| **context7** | `/plugin install context7@claude-plugins-official` | актуальна документація будь-якої бібліотеки (React, Remotion, Next.js...) замість застарілих знань моделі |
| **frontend-design** | `/plugin install frontend-design@claude-plugins-official` | сайти й інтерфейси, що не виглядають як шаблон ШІ |
| **skill-creator** | `/plugin install skill-creator@claude-plugins-official` | створення і тестування власних скілів |
| playwright | `/plugin install playwright@claude-plugins-official` | браузер для Claude: відкрити сайт, клікнути, зробити скриншот |
| code-review | `/plugin install code-review@claude-plugins-official` | рев'ю змін у коді |
| code-simplifier | `/plugin install code-simplifier@claude-plugins-official` | спрощення коду без зміни поведінки |
| feature-dev | `/plugin install feature-dev@claude-plugins-official` | розробка фічі: дослідження коду → архітектура → реалізація |
| claude-md-management | `/plugin install claude-md-management@claude-plugins-official` | підтримка файлу CLAUDE.md в актуальному стані |
| document-skills | `/plugin install document-skills@anthropic-agent-skills` | офіційні скіли Anthropic для docx, xlsx, pptx, pdf |

Після встановлення: `/plugin` показує, що стоїть; оновлення там же.

## Скіли, які краще ставити з першоджерела

- **Apple Design** (github.com/dickwu/apple-design-skill): рев'юер UI за Apple Human Interface Guidelines (123 сторінки HIG, 57 компонентів). У репо немає ліцензії і текст належить Apple, тому сюди не копіював. Встановлення:
  ```bash
  git clone https://github.com/dickwu/apple-design-skill ~/.claude/skills/apple-design
  ```
- **Impeccable** (github.com/pbakaus/impeccable, Apache-2.0): дизайн-мова для ШІ-агентів. Запускає `npx` при кожному виклику, тому став свідомо.
