# Копіює скіли в ~/.claude/skills/.
# .\install.ps1                  усі групи, крім hyperframes
# .\install.ps1 design video     лише вибрані групи
# Групи: design marketing writing knowledge linkedin video hyperframes
param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Groups)

$Root = $PSScriptRoot
$Dest = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME ".claude\skills" }
New-Item -ItemType Directory -Force $Dest | Out-Null

if (-not $Groups -or $Groups.Count -eq 0) { $Groups = @("design", "marketing", "writing", "knowledge", "linkedin", "video") }

function Get-SkillDirs([string]$g) {
    switch ($g) {
        "design"      { Get-ChildItem "$Root\skills\design" -Directory | Where-Object Name -ne "_licenses" }
        "marketing"   { Get-ChildItem "$Root\skills\marketing" -Directory | ForEach-Object { Get-ChildItem $_.FullName -Directory } }
        "writing"     { Get-Item "$Root\skills\writing\humanizer" }
        "knowledge"   { Get-Item "$Root\skills\knowledge\book-to-skill" }
        "linkedin"    { Get-ChildItem "$Root\skills\linkedin\linkedin-agent-skill\skills" -Directory }
        "video"       { Get-Item "$Root\skills\video\video-craft" }
        "hyperframes" { Get-ChildItem "$Root\skills\video\hyperframes\skills" -Directory }
        default       { throw "Невідома група: $g" }
    }
}

foreach ($g in $Groups) {
    foreach ($d in Get-SkillDirs $g) {
        if (-not (Test-Path (Join-Path $d.FullName "SKILL.md"))) { continue }
        $target = Join-Path $Dest $d.Name
        if (Test-Path $target) { Write-Host "пропускаю $($d.Name) (вже є в $Dest)"; continue }
        Copy-Item $d.FullName $target -Recurse
        Write-Host "+ $($d.Name)"
    }
}

Write-Host "Готово. Скіли в $Dest. Перезапусти Claude Code."
