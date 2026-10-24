# Agent-Reach і Graphify

## Agent-Reach: інтернет і соцмережі для Claude

**Що:** github.com/Panniantong/Agent-Reach (MIT). «Роутер» доступу до 16 платформ: YouTube, Reddit, Twitter/X, Instagram, LinkedIn, GitHub, RSS, вебсторінки, пошук (Exa) та китайські платформи. Тільки читання, без постингу. Частина каналів працює без налаштувань, Instagram/LinkedIn/Twitter вимагають бекенди і логін.

**Встановлення (в окремий venv, щоб не засмічувати систему):**
```bash
python -m venv agent-reach-venv
agent-reach-venv/Scripts/pip install agent-reach      # або з клону: pip install .
agent-reach-venv/Scripts/agent-reach doctor --json    # показує, які канали живі
```
У пакеті є власний скіл: `agent-reach-venv/Lib/site-packages/agent_reach/skill/SKILL.md`. Його можна скопіювати в `~/.claude/skills/agent-reach/`, але врахуй: скіл написаний китайською і оголошує себе обов'язковим для будь-якого пошуку в інтернеті, тобто перехоплює запити. Якщо не хочеш цього, не реєструй скіл, а просто кажи Claude «використай agent-reach для X».

Правила: LinkedIn лише публічні сторінки; розсилку і автоматичну відправку повідомлень через нього не робити (бан акаунту).

## Graphify: папка → граф знань

**Що:** github.com/Graphify-Labs/graphify (Apache-2.0), pip-пакет `graphifyy`. Перетворює папку з кодом, документами, PDF, картинками в граф, по якому Claude шукає зв'язки, і малює HTML-візуалізацію.

```bash
python -m venv graphify-venv
graphify-venv/Scripts/pip install graphifyy
```

Чесний висновок з тесту: на наборі окремих скриптів (не пов'язана система) звичайний grep знаходив не гірше за граф. Graphify має сенс на великому зв'язному кодовому репо або базі знань, де важливі зв'язки між файлами, а не на папці утиліт.
