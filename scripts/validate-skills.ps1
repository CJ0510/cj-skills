[CmdletBinding()]
param(
    [string]$Root
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Root)) {
    $Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

$skillsRoot = Join-Path $Root 'skills'
if (-not (Test-Path -LiteralPath $skillsRoot -PathType Container)) {
    throw "Skills directory not found: $skillsRoot"
}

$skillDirectories = @(Get-ChildItem -LiteralPath $skillsRoot -Directory | Sort-Object Name)
if ($skillDirectories.Count -eq 0) {
    throw "No skills found under: $skillsRoot"
}

$errors = [System.Collections.Generic.List[string]]::new()

foreach ($directory in $skillDirectories) {
    $skillFile = Join-Path $directory.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        $errors.Add("[$($directory.Name)] Missing SKILL.md")
        continue
    }

    $content = Get-Content -LiteralPath $skillFile -Raw -Encoding UTF8
    $frontmatterMatch = [regex]::Match($content, '\A---\r?\n(?<yaml>.*?)\r?\n---', 'Singleline')
    if (-not $frontmatterMatch.Success) {
        $errors.Add("[$($directory.Name)] Invalid YAML frontmatter boundary")
        continue
    }

    $frontmatter = $frontmatterMatch.Groups['yaml'].Value
    $nameMatch = [regex]::Match($frontmatter, '(?m)^name:\s*["'']?(?<value>[a-z0-9-]+)["'']?\s*$')
    $descriptionMatch = [regex]::Match($frontmatter, '(?m)^description:\s*(?<value>.+?)\s*$')

    if (-not $nameMatch.Success) {
        $errors.Add("[$($directory.Name)] Missing or invalid name")
    }
    elseif ($nameMatch.Groups['value'].Value -ne $directory.Name) {
        $errors.Add("[$($directory.Name)] Frontmatter name does not match directory")
    }

    if (-not $descriptionMatch.Success -or [string]::IsNullOrWhiteSpace($descriptionMatch.Groups['value'].Value)) {
        $errors.Add("[$($directory.Name)] Missing description")
    }
    elseif ($descriptionMatch.Groups['value'].Value -match '^\[TODO:') {
        $errors.Add("[$($directory.Name)] Description contains TODO placeholder")
    }

    if ($content -match '(?m)^\s*\[TODO:[^\r\n]*\]\s*$') {
        $errors.Add("[$($directory.Name)] Instructions contain TODO placeholder")
    }

    $links = [regex]::Matches($content, '\[[^\]]+\]\((?<path>[^)#]+\.md)(?:#[^)]+)?\)')
    foreach ($link in $links) {
        $relativePath = $link.Groups['path'].Value.Replace('/', [IO.Path]::DirectorySeparatorChar)
        $targetPath = Join-Path $directory.FullName $relativePath
        if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
            $errors.Add("[$($directory.Name)] Missing referenced file: $relativePath")
        }
    }

    $openAiYaml = Join-Path $directory.FullName 'agents\openai.yaml'
    if (Test-Path -LiteralPath $openAiYaml -PathType Leaf) {
        $openAiContent = Get-Content -LiteralPath $openAiYaml -Raw -Encoding UTF8
        foreach ($field in @('display_name', 'short_description', 'default_prompt')) {
            if ($openAiContent -notmatch "(?m)^\s+${field}:\s*.+$") {
                $errors.Add("[$($directory.Name)] agents/openai.yaml missing $field")
            }
        }
    }

    Write-Host "Validated $($directory.Name)"
}

if ($errors.Count -gt 0) {
    Write-Error ("Skill validation failed:`n- " + ($errors -join "`n- "))
    exit 1
}

Write-Host "All $($skillDirectories.Count) skill(s) passed validation."
