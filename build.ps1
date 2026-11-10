param([string]$Document = 'all', [switch]$List, [string]$Compiler)
$ErrorActionPreference = 'Stop'
$documents = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'documents.json') -Raw -Encoding UTF8 | ConvertFrom-Json
if ($List) {
    $documents.PSObject.Properties | ForEach-Object { Write-Output ($_.Name + ': ' + $_.Value.title) }
    return
}
if ($Document -ne 'all' -and $Document -notin $documents.PSObject.Properties.Name) {
    throw "Unknown document '$Document'. Run ./build.ps1 -List."
}
$executable = $Compiler
if (-not $executable) {
    $command = Get-Command typst -ErrorAction SilentlyContinue
    if (-not $command) { $command = Get-Command tinymist -ErrorAction SilentlyContinue }
    if ($command) { $executable = $command.Source }
}
if (-not $executable) {
    $extensionRoot = Join-Path $env:USERPROFILE '.vscode\extensions'
    if (Test-Path -LiteralPath $extensionRoot) {
        $executable = Get-ChildItem -LiteralPath $extensionRoot -Directory -Filter 'myriad-dreamin.tinymist-*' |
            Sort-Object LastWriteTime -Descending |
            ForEach-Object { Join-Path $_.FullName 'out\tinymist.exe' } |
            Where-Object { Test-Path -LiteralPath $_ } |
            Select-Object -First 1
    }
}
if (-not $executable) { throw 'Install Typst CLI or the Tinymist Typst extension for VS Code.' }
foreach ($entry in $documents.PSObject.Properties) {
    if ($Document -ne 'all' -and $Document -ne $entry.Name) { continue }
    $source = Join-Path $PSScriptRoot $entry.Value.source
    $output = Join-Path $PSScriptRoot $entry.Value.output
    New-Item -ItemType Directory -Path (Split-Path -Parent $output) -Force | Out-Null
    Write-Output ('Building ' + $entry.Name)
    & $executable compile --root $PSScriptRoot $source $output
    if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $LASTEXITCODE" }
    Write-Output $output
}
