# MCP-сервери для маркетингу (SEO, конкуренти, реклама Meta)

MCP-сервер дає Claude нові інструменти (дані Semrush, Ahrefs, бібліотеки реклами Facebook). Підключаються в Claude Desktop (`claude_desktop_config.json`) або в Claude Code (`claude mcp add ...`). Ключі API ніколи не коміть у git, тримай у змінних середовища.

| Сервер | Репо | Що дає | Що потрібно |
|--------|------|--------|-------------|
| **Facebook Ads Library MCP** | github.com/RamsesAguirre777/facebook-ads-library-mcp (MIT) | реклама конкурентів з Meta Ad Library: креативи, тексти, дати запуску | Python, `pip install -r requirements.txt`, Facebook access token |
| **Semrush MCP** | github.com/mrkooblu/semrush-mcp | ключові слова, домени, беклінки, трафік; є і CLI `semrush` для Claude Code | `npm install -g github:mrkooblu/semrush-mcp`, платний `SEMRUSH_API_KEY` |
| **SEO MCP (Ahrefs)** | github.com/cnych/seo-mcp | беклінки, ключі, оцінка трафіку з безкоштовних інструментів Ahrefs | `pip install seo-mcp` або `uvx seo-mcp`, ключ CapSolver (розв'язує капчу) |
| **Firecrawl MCP** | npm `firecrawl-mcp` | скрапінг і краулінг сайтів у markdown | `FIRECRAWL_API_KEY` (є безкоштовний ліміт) |

## Приклад конфігу Claude Desktop

`%APPDATA%\Claude\claude_desktop_config.json` (Windows) або `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS):

```json
{
  "mcpServers": {
    "facebook-ads-library": {
      "command": "python",
      "args": ["C:\\path\\to\\facebook-ads-library-mcp\\facebook_ads_mcp_complete.py",
               "--facebook-token", "<FACEBOOK_ACCESS_TOKEN>"]
    },
    "seo-mcp": {
      "command": "uvx",
      "args": ["--python", "3.10", "seo-mcp"],
      "env": { "CAPSOLVER_API_KEY": "<ключ>" }
    },
    "semrush-mcp": {
      "command": "semrush-mcp",
      "args": [],
      "env": { "SEMRUSH_API_KEY": "<ключ>" }
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": { "FIRECRAWL_API_KEY": "<ключ>" }
    }
  }
}
```

## Те саме в Claude Code

```bash
claude mcp add firecrawl -e FIRECRAWL_API_KEY=<ключ> -- npx -y firecrawl-mcp
claude mcp add seo-mcp -e CAPSOLVER_API_KEY=<ключ> -- uvx --python 3.10 seo-mcp
```

Після перезапуску перевір `/mcp` у Claude Code: сервер має бути зі статусом connected.
