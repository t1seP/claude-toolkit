# CLAUDE.md: інструкція для Claude в цьому репо

Ти відкритий у репозиторії **claude-toolkit**. Це набір скілів, застосунок Roast Room і гайди для Claude Code з маркетингу, дизайну, LinkedIn і відеомонтажу. Людина, яка тебе запустила, отримала репо від знайомого і може не знати, як це все працює. Твоя задача: допомогти встановити потрібне і користуватись цим. Пиши користувачу простою мовою, без жаргону, тією мовою, якою він до тебе звертається (за замовчуванням українською).

## Карта репо

| Шлях | Що там |
|------|--------|
| `skills/design/` | taste-skill, redesign-skill, 6 скілів Emil Kowalski (UI, анімації) |
| `skills/marketing/coreyhaines-marketingskills/` | 13 скілів: копірайт, реклама, A/B, аналітика, лід-магніти, психологія |
| `skills/marketing/kostja94-marketing-skills/` | 7 скілів: SEO, ключові слова, Search Console, конкуренти, Meta Ads |
| `skills/writing/humanizer/` | прибирає з тексту ознаки ШІ |
| `skills/knowledge/book-to-skill/` | книга або PDF → скіл (потрібен Python) |
| `skills/linkedin/linkedin-agent-skill/skills/` | 11 скілів `li-*` для LinkedIn |
| `skills/video/video-craft/` | правила монтажу і моушну |
| `skills/video/hyperframes/skills/` | 21 скіл HyperFrames (відео з HTML/CSS) |
| `apps/roast-room/` | рада з 7 радників для бізнес-рішень, локальний вебзастосунок |
| `guides/video/` | гайди 01-05: ffmpeg + Whisper, UGC у Remotion, yt-dlp, креативи кодом, ефекти |
| `guides/tools/` | PhotoCraft, Agent-Reach, Graphify, MCP-сервери |
| `PLUGINS.md` | плагіни Claude Code і команди встановлення |
| `CATALOG.md` | інші перевірені репозиторії з вердиктами |
| `install.sh`, `install.ps1` | копіюють скіли в `~/.claude/skills/` |

## Якщо користувач каже «налаштуй», «встанови», «що тут є», «з чого почати»

1. Коротко поясни, що в репо (3-5 рядків, без таблиць на пів екрана), і спитай, чим людина займається і що хоче робити: маркетинг, сайти й дизайн, LinkedIn, відео. Не став усе наосліп.
2. Перевір середовище: ОС, що вже лежить у `~/.claude/skills/` (щоб не перезаписати чуже), чи є `node`, `python`/`py`, `git`, `ffmpeg` (останнє тільки для відео).
3. Встанови вибрані групи скриптом. Він пропускає скіли, що вже існують, і нічого не перезаписує:
   - Windows (PowerShell): `.\install.ps1 design marketing`
   - macOS / Linux / Git Bash: `./install.sh design marketing`
   - Групи: `design marketing writing knowledge linkedin video hyperframes`. Без аргументів ставиться все, крім `hyperframes`.
4. Запропонуй плагіни з `PLUGINS.md`. Мінімум `superpowers` і `context7`. Встановити їх можна з терміналу: `claude plugin marketplace add <owner/repo>`, потім `claude plugin install <плагін>@<маркетплейс>`. Якщо CLI-команда не спрацює, дай користувачу слеш-команди з `PLUGINS.md`, щоб він ввів їх сам: ти їх виконати не можеш.
5. Скажи перезапустити Claude Code: нові скіли підхоплюються після перезапуску.
6. Наприкінці дай короткий список: що встановлено і 3-4 приклади фраз, якими це викликати.

## Правила

- **HyperFrames не ставити без прямої згоди.** Скіл `hyperframes` оголошує себе обов'язковим для будь-якого запиту про відео і перехоплюватиме роботу з Remotion. Спершу поясни це, і лише після «так» запускай `install ... hyperframes`. Для рендеру йому ще потрібен npm-пакет `hyperframes` (Node 22+, Chromium). Статистику використання вимикає `HYPERFRAMES_NO_TELEMETRY=1`.
- **Перед встановленням будь-чого стороннього** (pip, npm, клон репо з `CATALOG.md` чи `guides/tools/`) покажи, що саме ставиш і звідки, і отримай згоду. Python-інструменти став в окремий venv.
- **Ключі API** (Anthropic, Semrush, Firecrawl, CapSolver, Facebook) ніколи не записуй у файли репо і не коміть. Тільки `.env` (він у `.gitignore`) або змінні середовища.
- Не змінюй скіли в `skills/` без прохання: це копії з чужих репозиторіїв, оригінали й ліцензії вказані в `README.md`. Свої правки користувач робить у копії в `~/.claude/skills/`.
- Скіли Corey Haines спершу шукають контекст продукту (`product-marketing-context`). Якщо його немає, запропонуй один раз описати продукт/бізнес користувача: далі всі маркетингові скіли писатимуть під нього.

## Що відкривати під задачу

| Користувач хоче | Бери |
|-----------------|------|
| текст для сайту, лендингу, реклами | скіли `copywriting`, `ad-creative`, `copy-editing`, потім `humanizer` |
| SEO, ключові слова, аудит сайту | `seo-audit`, `seo-strategy`, `keyword-research`, `google-search-console` |
| реклама у Facebook/Instagram | `meta-ads`, `paid-ads-strategy`, `ad-creative`; дані конкурентів через Facebook Ads Library MCP (`guides/tools/mcp-servers.md`) |
| A/B-тест, аналітика, трекінг | `ab-test-setup`, `analytics-tracking` |
| сайт або інтерфейс, що не виглядає як шаблон | `taste-skill`, `redesign-skill`, `emil-design-eng`; анімації `emil-animate`, `emil-review-animations` |
| LinkedIn | `li-profile` (почати з аудиту профілю), `li-plan`, `li-post`, `li-carousel` |
| змонтувати ролик / рілс | `video-craft` + `guides/video/01` (ffmpeg і Whisper) або `02` (Remotion) |
| розібрати чужий рілс чи відео | `guides/video/03`: yt-dlp, транскрипт, контактні аркуші кадрів |
| банери й ролики кодом пачкою | `guides/video/04`, найдетальніший гайд |
| ефекти як у «дорогих» рілсах | `guides/video/05` |
| обробити фото (прибрати об'єкт, вирізати людину, ретуш) | `guides/tools/photocraft.md` |
| зробити скіл з книги | `book-to-skill` |
| ухвалити бізнес-рішення | Roast Room, див. нижче |
| парсинг сайтів, соцмереж, симуляція аудиторії | `CATALOG.md`, `guides/tools/agent-reach-graphify.md` |

Гайди в `guides/` це не скіли: читай потрібний файл, коли береш задачу, і йди за його кроками й попередженнями.

## Roast Room

- Запуск: `cd apps/roast-room`, `npm start` у фоні (Node 20+), відкрити http://localhost:4730.
- Засідання запускається з Claude Code, відкритого саме в папці `apps/roast-room` (там свій `CLAUDE.md` і скіл): `/roast-room <рішення>` або `/roast-room --quick <рішення>`.
- Попереджай: повна рада з'їдає ~1M токенів, на підписці Pro це помітно; `--quick` значно дешевший.
- Радники це симуляції за публічними текстами, а не справжні люди.
- Після зупинки `npm start` процес node може лишитись на порту 4730: на Windows знайти й зупинити через `Get-NetTCPConnection -LocalPort 4730`.
