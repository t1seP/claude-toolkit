# Roast Room

This project is the Roast Room: a council of seven simulated advisors (Bezos, Paul Graham, Hormozi, Gary Vaynerchuk, Dan Martell, Gino Wickman, Buffett) that debates a founder's business decision.

- When the user brings a decision ("should I...", pricing, hiring, raising money, a new product, a pivot), run `/roast-room`. For a quick question to one advisor, use `/roast-room ask <seat> ...`.
- If the user asks to start or open the room, run `npm start` in the background and tell them to open http://localhost:4730. It needs Node 20 or newer and nothing else.
- Councils are saved in `sessions/<date>-<decision>/`. The room plays them live as those files land. Follow `.claude/skills/roast-room/references/live-room.md` exactly so the room can read them.
- The seats are simulations built from public work. Never present a seat's words as something the real person said unless it is a verbatim quote with a source id from that seat's brain.
- Write the Chair's parts in plain English: short sentences, no hype, no filler. Keep the verdict in chat short enough to decide from at a glance; the full report goes in `verdict.md`, and the room's "Download PDF" button turns it into a branded PDF.

## Мова: українська (локалізація Тимофія, 2026-10-17)

- Усе, що читає людина, пиши українською: питання Голови, `brief.md`, Chair notes, `draft-resolution.md`, `verdict.md`, коротка відповідь у чаті, і всі текстові поля JSON (`title`, `decision`, `label` опцій, `reason`, `brief`, `assumptions`, `question`/`position` у cruxes, `recommendation`, `call`, `point`, `would_have_to_be_true`, `when`, `action`, `story`, `reason` поправок тощо).
- Радники говорять українською, у своєму голосі.
- Службові коди лишаються англійською, бо кімната їх розбирає: назви полів картки (`SEAT:`, `STANCE:`, `OPTION SCORES:`, `THE CALL:`, `MOVED:`, `VOTE:`, `ONE LINE FOR THE FOUNDER:` і решта), значення `Strong yes | Yes | Conditional yes | No | Strong no`, `Endorse | Endorse with amendment | Dissent`, `none | possible | likely`, `one-way | two-way`, `MOVED: no | yes, ...`, ярлик вердикту `GO | GO WITH CONDITIONS | RESHAPE | WAIT | DON'T DO IT` у `label` JSON, `mode`, ключі радників.
- Дослівні цитати з brain лишаються англійською дослівно (їх перевіряє `check_quotes.py`), одразу після цитати в дужках дай український переклад.
- Імена радників не перекладай.
