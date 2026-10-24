# PhotoCraft CLI: «Фотошоп з командного рядка» для Claude

**Що:** github.com/storytold/photocraft. Портативний редактор, яким Claude керує командами: шари, текст, фільтри, виділення, content-aware fill. Віддає PNG (сплющено) або PSD з живими шарами (текст редагований, фото смарт-об'єкт), тобто результат можна передати дизайнеру. Рання альфа (v0.3.0).

**Встановлення:** скачати з Releases portable-збірку під свою ОС (`photocraft-<версія>-windows-x64-portable`), розпакувати будь-куди. Інсталяції немає. ~130 МБ, тому в цей репо не вкладено.

## Як користуватись

```bash
photocraft-cli commands --json          # повний реєстр (~776 команд) — дати Claude прочитати
photocraft-cli run --new '{json}' --cmd <id> --params '{json}' ... --out file.png|.psd
```

Найпростіше: попросити Claude написати Python-скрипт `build.py`, який складає ланцюжок `run` і запускає його через subprocess.

## Де він сильніший за Remotion/HTML

Обробка пікселів:
- `edit.contentAwareFill` прибрати наліпки, руку, сміття з кадру;
- `select.colorRange highlights` + `layer.new.layerViaCopy` + `outerGlow screen` = LED-підсвітка реально світиться;
- `filter.render.lightingEffects`, криві, фільтри;
- `type.create` повертає ink-bounds → підбір кегля за реальною шириною і ліва межа по чорнилу;
- `gradient.fill.create` з `transparency: [[t 0..1, opacity 0..100], ...]` = CSS linear-gradient з кількома стопами;
- `layer.layerStyle.dropShadow`, `layer.setProps {opacity}` без id діють на щойно створений шар.

## Рецепти

**Ретуш інтер'єрних фото:** `filter.noise.reduceNoise {removeJpegArtifact:true}` → `image.adjustments.shadowsHighlights` → крива S → `photoFilter warming81` 0-20 → vibrance → `smartSharpen`.
- чорні фасади: shadowAmount ≤8, інакше чорне сіріє;
- сіро-зелені фасади: warm=0, інакше оливка;
- працювати на копіях вихідників, не на готових банерах.

**Портрет / заміна фону (аватарка):** `select.subject` → `select.refineEdge {smartRadius, decontaminate, output:newLayerWithMask}` (чиста вирізка волосся).
- refineEdge ігнорує `output:"selection"`, завжди робить новий шар з маскою, а вихідний ховає: перед роботою з фоном `layer.setProps {layer:2, visible:true}`.
- Розмитий білий фон: на нижньому шарі `select.subject` + `select.modify.expand {radius:40}` (саме `radius`, не `by`) → `contentAwareFill` → `gaussianBlur 60` → levels у білий + hueSaturation -70.
- Фон «офіс у боке» зі згенерованої картинки: фон з AI-картинки, обличчя з реального фото. Якщо `select.subject` на AI-фото промахується, обвести людину `select.lasso` → contentAwareFill → blur 14 → levels світліше = «плита»; потім `file.placeEmbedded` над шаром 2 і під вирізкою; світло від вікна = `gradient.fill.create` softLight + `layer.createClippingMask`.

## Граблі

- ⚠ **Активне виділення обмежує ВСІ наступні фільтри.** Після `select.rect` / `colorRange` / `contentAwareFill` завжди `select.deselect`, інакше ефект ляже тільки в прямокутник.
- ⚠ Glow по highlights без обмеження зоною хапає білі стільниці й грані (радіоактивний вигляд): поріг 244-247 + intersect з прямокутником потрібної зони.
- Шрифти лише системні: потрібну гарнітуру спершу встановити в Windows.
- `sed` у bash з'їдає `\a` у Windows-шляхах (`\agents` → символ BEL): шляхи писати в Python r-рядках.
