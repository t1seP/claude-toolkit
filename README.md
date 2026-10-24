# Claude Toolkit: скіли, інструменти і гайди для маркетингу, дизайну і відео

Зібрав в одне місце те, що сам скачував з інтернету і використовую в Claude Code: скіли з маркетингу, дизайну, LinkedIn і відео, «раду радників» для рішень, гайди з монтажу і генерації креативів кодом, а також список плагінів і корисних репозиторіїв з вердиктами.

Усе стороннє лежить з ліцензіями авторів (MIT / Apache-2.0). Звідки кожна річ, вказано нижче.

## Що всередині

```
skills/            скіли Claude Code (копіюються в ~/.claude/skills/)
  design/          смак і рух в інтерфейсах: taste, redesign, 6 скілів Emil Kowalski
  marketing/       20 маркетингових скілів (копірайт, SEO, CRO, A/B, Meta Ads, контент)
  writing/         humanizer: прибирає з тексту ознаки ШІ
  knowledge/       book-to-skill: книга або PDF → скіл
  linkedin/        11 скілів для ведення LinkedIn
  video/           video-craft (правила монтажу) + 21 скіл HyperFrames
apps/
  roast-room/      рада з 7 радників дебатує твоє бізнес-рішення (українською)
guides/
  video/           монтаж і креативи кодом: ffmpeg, Whisper, Remotion, ефекти
  tools/           PhotoCraft, Agent-Reach, Graphify, MCP-сервери
PLUGINS.md         плагіни Claude Code і як їх поставити (superpowers, context7, ...)
CATALOG.md         інші репозиторії, які я перевірив, з вердиктами
```

## Швидкий старт

1. Встанови [Claude Code](https://claude.com/claude-code).
2. Склонуй репо:
   ```bash
   git clone <url цього репо> claude-toolkit
   cd claude-toolkit
   ```
3. Скопіюй скіли, які потрібні (або всі), у `~/.claude/skills/`:
   ```bash
   ./install.sh                 # macOS / Linux / Git Bash: усі скіли
   ./install.sh design video    # лише вибрані групи
   ```
   ```powershell
   .\install.ps1                # Windows PowerShell: усі скіли
   .\install.ps1 design video
   ```
   Скіл, що лежить у `~/.claude/skills/<назва>/SKILL.md`, доступний у всіх проєктах. Щоб скіл працював лише в одному проєкті, клади його в `<проєкт>/.claude/skills/`.
4. Перезапусти Claude Code. Скіли спрацьовують самі за описом (наприклад, «напиши лендинг» підтягне `copywriting`), або викликаються як `/назва-скіла`.
5. Постав плагіни з [PLUGINS.md](PLUGINS.md). Мінімум: `superpowers` і `context7`.

## Скіли

### Дизайн (`skills/design`)

| Скіл | Що робить | Джерело |
|------|-----------|---------|
| `taste-skill` | «смак» для фронтенду: щоб сайт не виглядав як типовий ШІ-шаблон | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) |
| `redesign-skill` | аудит і апгрейд існуючого сайту до преміум-рівня | там само |
| `emil-design-eng` | філософія полірування UI від Emil Kowalski (автор Sonner, Vaul) | [emilkowalski/skill](https://github.com/emilkowalski/skill) |
| `emil-animate` | побудова анімації з нуля в правильному порядку рішень | там само |
| `emil-review-animations` | критика існуючого руху | там само |
| `emil-animation-performance` | анімації без просідання кадрів | там само |
| `emil-animation-vocabulary` | «як називається ефект, коли...» → точний термін для промпту | там само |
| `emil-break-ui` | ламає компонент найгіршими даними (довгі імена, емодзі, нулі) і показує, що впало | там само |

### Маркетинг (`skills/marketing`)

Два паки, обидва MIT.

[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills): `copywriting`, `copy-editing`, `ad-creative`, `paid-ads`, `ab-test-setup`, `analytics-tracking`, `aso-audit`, `competitor-alternatives`, `content-strategy`, `free-tool-strategy`, `lead-magnets`, `marketing-ideas`, `marketing-psychology`.

[kostja94/marketing-skills](https://github.com/kostja94/marketing-skills): `seo-audit`, `seo-strategy`, `keyword-research`, `google-search-console`, `competitor-research`, `meta-ads`, `paid-ads-strategy`. В оригінальному паку 160+ скілів, тут лише ті, якими я користувався.

Порада: скіли Corey Haines спершу шукають файл з контекстом продукту (`product-marketing-context`). Один раз опиши свій продукт/клієнта, і всі скіли пишуть під нього.

### Тексти (`skills/writing`)

`humanizer` ([blader/humanizer](https://github.com/blader/humanizer)): прибирає з тексту типові ознаки ШІ (штампи, «не просто X, а Y», зайві тире, трійки прикметників).

### Знання (`skills/knowledge`)

`book-to-skill` ([virgiliojr94/book-to-skill](https://github.com/virgiliojr94/book-to-skill)): перетворює книгу (PDF, EPUB, DOCX) на скіл з фреймворками, принципами і техніками автора. Далі Claude застосовує книгу в роботі. Великі книги розбиває на глави і вантажить на вимогу. Потрібен Python.

### LinkedIn (`skills/linkedin`)

[Jakeschincariol/linkedin-agent-skill](https://github.com/Jakeschincariol/linkedin-agent-skill): `li-profile` (аудит профілю), `li-post`, `li-carousel`, `li-comment`, `li-reply`, `li-repurpose`, `li-plan`, `li-audit`, `li-human`, `li-dm`, `li-inbox`. Обережно з `li-dm` і `li-inbox`: тексти нормальні, але автоматичну розсилку через них не роби, LinkedIn банить.

### Відео (`skills/video`)

- `video-craft`: мої правила монтажу, зібрані з рілсів і реальних рендерів: склейка по погляду і «правило шести» Мерча, безпечні зони 9:16, хук-перехід-тіло, рухи камери для промптів відеонейромереж, стиль HUD Lime, граблі Remotion.
- `hyperframes/skills/*` ([heygen-com/hyperframes](https://github.com/heygen-com/hyperframes), Apache-2.0): 21 скіл для відео з HTML/CSS: субтитри (`embedded-captions`), перемонтаж говорящої голови (`talking-head-recut`), моушн-графіка, відео під музику, faceless-пояснювачі, слайдшоу, переїзд з Remotion.
  ⚠ Скіл `hyperframes` оголошує себе обов'язковою точкою входу для **будь-якого** запиту про відео. Якщо ти робиш відео в Remotion, він перехоплюватиме запити. Тому `install.sh` за замовчуванням HyperFrames не ставить, лише з прапорцем `hyperframes`. Для рендеру потрібен ще npm-пакет `hyperframes` (Node 22+, тягне Chromium).

## Roast Room (`apps/roast-room`)

[nateherkai/roast-room](https://github.com/nateherkai/roast-room) (MIT) з моєю українською локалізацією. Сім симульованих радників (Безос, Пол Грем, Хормозі, Гері Вайнерчук, Ден Мартелл, Джино Вікман, Баффет) дебатують твоє рішення («чи варто...», ціна, найм, новий продукт) і видають вердикт GO / WAIT / DON'T з умовами. У браузері на localhost:4730 видно засідання наживо, є PDF-звіт.

```bash
cd apps/roast-room
npm start                 # кімната на http://localhost:4730 (Node 20+)
claude                    # у цій же папці
/roast-room чи варто мені ...
/roast-room --quick ...   # швидкий режим, менше токенів
```

Повна рада з'їдає ~1M токенів (на підписці Max ок, на API дорого). Радники це симуляції за публічними текстами, не справжні люди. У `sessions/` три приклади засідань.

## Гайди

### Відео й креативи (`guides/video`)

1. [Монтаж рілса без програм монтажу: ffmpeg + Whisper + Pillow](guides/video/01-montazh-ffmpeg-whisper.md)
2. [Монтаж UGC-реклами через Remotion: конвеєр](guides/video/02-ugc-reklama-remotion.md)
3. [Скачати і розшифрувати відео: yt-dlp + faster-whisper + контактні аркуші](guides/video/03-transkrybatsiya-yt-dlp-whisper.md)
4. [Рекламні креативи кодом: банери і ролики в Remotion](guides/video/04-reklamni-kreatyvy-kodom.md), найбільший: розкладка, кегль, фото, переходи, QA, звук
5. [Ефекти й поради по моушну](guides/video/05-efekty-i-porady-montazhu.md): каталог ефектів говорящої голови, рецепт «дорогого» вигляду

### Інструменти (`guides/tools`)

- [PhotoCraft CLI](guides/tools/photocraft.md): Фотошоп з командного рядка (content-aware fill, вирізка людини, ретуш, PSD з шарами)
- [Agent-Reach і Graphify](guides/tools/agent-reach-graphify.md): доступ до соцмереж для Claude і граф знань з папки
- [MCP-сервери](guides/tools/mcp-servers.md): Meta Ad Library, Semrush, Ahrefs, Firecrawl

## Безпека

- Перед встановленням будь-якого скіла прочитай його `SKILL.md`: скіл це інструкції, які Claude виконуватиме.
- API-ключі тримай у `.env` або змінних середовища, не в git (`.gitignore` уже це враховує).
