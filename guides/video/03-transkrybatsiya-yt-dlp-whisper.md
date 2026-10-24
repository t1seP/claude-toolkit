# Скачати і розшифрувати відео: yt-dlp + faster-whisper + контактні аркуші

Навіщо: розібрати чужий рілс чи YouTube-відео (що кажуть, як змонтовано), зробити субтитри до свого відео, дати Claude «подивитись» ролик.

## Встановлення

```bash
pip install yt-dlp faster-whisper
```
ffmpeg потрібен окремо (див. [01-montazh-ffmpeg-whisper.md](01-montazh-ffmpeg-whisper.md)). На Windows yt-dlp зручно кликати як `py -m yt_dlp`, якщо він не в PATH.

## Скачати

```bash
# публічні Instagram-рілси працюють без cookies; підпис рілса лягає в *.info.json
py -m yt_dlp -o "%(id)s.%(ext)s" --write-info-json -a urls.txt

# довге YouTube-відео (години) не транскрибувати, а забрати автосубтитри
py -m yt_dlp --skip-download --write-auto-subs --sub-langs "en-orig,en" --sub-format json3 <url>

# знайти відео за назвою
py -m yt_dlp --print "%(id)s %(title)s" "ytsearch5:назва відео"
```

- json3 парсити Python'ом (без `--convert-subs`, якщо ffmpeg не в PATH). На помилку 429 просто повторити.
- Карусель з однаковими слайдами-зображеннями yt-dlp не бере («No video formats»), лишається тільки підпис.
- Приватний контент: потрібні cookies браузера (`--cookies-from-browser chrome`), і браузер має бути закритий, бо база cookies заблокована.

## Розшифрувати

```python
# transcribe.py — пословні таймкоди, українська, VAD
import json, sys
from faster_whisper import WhisperModel

model = WhisperModel("large-v3-turbo", device="cpu", compute_type="int8")
segments, info = model.transcribe(sys.argv[1], language="uk", vad_filter=True, word_timestamps=True)
out = [{"start": s.start, "end": s.end, "text": s.text,
        "words": [{"w": w.word, "s": w.start, "e": w.end} for w in s.words]} for s in segments]
json.dump(out, open(sys.argv[1] + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
```

- Перше завантаження моделі ~2-3 хв (далі з кешу HuggingFace). Транскрипція ~100 с на 5 хв аудіо на звичайному CPU.
- Запускати ОДИН процес: два паралельні вдвічі сповільнюють обидва.
- Відео без мови Whisper «галюцинує» (видає випадкову мову). Такі відео дивитись кадрами.
- Час не вгадувати: заміряти на першому файлі і тоді рахувати пачку.
- На Windows для кирилиці у виводі: `PYTHONIOENCODING=utf-8`, а краще писати результат у файл UTF-8.

## Дати Claude «подивитись» відео

Контактний аркуш: кадр кожні 2 с, 6×2 мініатюри на одній картинці.

```bash
ffmpeg -i reel.mp4 -vf "fps=1/2,scale=300:-1,tile=6x2" sheet_%02d.png
```

Claude Code читає PNG інструментом Read і бачить монтаж: склейки, титри, ефекти. Разом із транскриптом цього вистачає, щоб сказати «розбери, як змонтовано, і повтори».

У ffmpeg, що постачається з Remotion, немає фільтрів `fps` і `tile`: брати повну збірку.
