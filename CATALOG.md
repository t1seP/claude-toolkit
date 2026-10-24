# Каталог: що ще знайшов і перевірив

Репозиторії, які я клонував і читав, але не вкладав сюди (великі, або потребують окремого встановлення, або не підійшли). Короткий вердикт після читання коду, щоб ти не витрачав час.

## Симуляція аудиторії і персон (перевірити рекламу/ідею на «віртуальних людях»)

| Репо | Що | Ліцензія | Вердикт |
|------|----|----------|---------|
| [microsoft/TinyTroupe](https://github.com/microsoft/TinyTroupe) | мультиагентна симуляція персон від Microsoft | MIT | найсолідніше з цієї групи; важкий (450 МБ з даними) |
| [DataViking-Tech/Althing](https://github.com/DataViking-Tech/Althing) | синтетичні фокус-групи, CLI + Python, будь-яка LLM | MIT | простий вхід |
| [anh-chu/synthusers](https://github.com/anh-chu/synthusers) | персони тестують продукт або генерують мок-дані | MIT | легкий |
| [lenin5558dif/ad-testing-agents](https://github.com/lenin5558dif/ad-testing-agents) | тест рекламного офера на персонах: конверсія, заперечення, «що б мене переконало» | без ліцензії | ідея корисна, код лише читати |
| [666ghj/MiroFish](https://github.com/666ghj/MiroFish) | «рій» агентів, що симулює суспільну реакцію | AGPL-3.0 | для тексту реклами надмірний |
| [alemaiorano/sim-to-real-validity](https://github.com/alemaiorano/sim-to-real-validity) | дослідження: чи передбачають персони реальну реакцію (на даних Upworthy) | MIT | **прочитай перед тим, як вірити персонам**: базова лінія без персон їх обіграла |

Висновок з усієї групи: персони дають ідеї й заперечення, але як предиктор CTR не доведені. Завжди поруч рахуй базову лінію без персон і калібруй по реальних цифрах.

## «Рада радників» для рішень

- [nateherkai/roast-room](https://github.com/nateherkai/roast-room) (MIT): вкладено в [apps/roast-room](apps/roast-room) з українською локалізацією.
- [JamoutAi/seat-at-the-table](https://github.com/JamoutAi/seat-at-the-table): ремікс Roast Room з 8 іншими радниками.

## Скрапінг сайтів

| Репо | Що | Ліцензія |
|------|----|----------|
| [unclecode/crawl4ai](https://github.com/unclecode/crawl4ai) | будь-який сайт → чистий markdown для LLM | Apache-2.0 |
| [D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling) | фреймворк скрапінгу від одного запиту до повного краулу, обхід захистів | BSD-3 |
| [ScrapeGraphAI/Scrapegraph-ai](https://github.com/ScrapeGraphAI/Scrapegraph-ai) | скрапер, де структуру сторінки розбирає LLM | MIT |

Для більшості задач вистачає Firecrawl MCP (див. [guides/tools/mcp-servers.md](guides/tools/mcp-servers.md)) або Playwright.

## Продажі

- [ethanplusai/harvey](https://github.com/ethanplusai/harvey) (MIT): автономний агент продажів на підписці Claude Code: пошук бізнесів (OpenStreetMap), профілювання сайтів, скоринг, послідовність листів, обробка відповідей, дашборд. Під англомовний ринок. Варто взяти ідеї: детермінований гейт перед відправкою (заборонені фрази, ліміт слів, ≤1 посилання), обробник відповідей, каталог сигналів для скорингу лідів.

## Відео

- [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) (Apache-2.0): скіли вкладено в [skills/video/hyperframes](skills/video/hyperframes). Сам рушій (npm `hyperframes`, тягне Chromium) ставиться окремо.
- [calesthio/OpenMontage](https://github.com/calesthio/OpenMontage) (AGPL-3.0): агентний монтаж поверх Claude Code.

## Що НЕ варто ставити (і чому)

- **find-skills / skills.sh** (каталог 700k скілів): не ставити глобально. Каталог гортати очима, кожен скіл ставити після читання його SKILL.md.
- **FreeLLMAPI**: код і дані підуть до випадкових безкоштовних провайдерів.
- **LLM Council** (aiwithremy): без ліцензії; Roast Room робить те саме краще.
- **github/spec-kit**: superpowers (`writing-plans`) робить те саме.
