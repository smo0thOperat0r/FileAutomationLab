$cutoffDate = (Get-Date).AddDays(-7)
$backupFolder = Join-Path $PSScriptRoot "Backup"

$oldFiles = Get-ChildItem -Path $PSScriptRoot -File |
    Where-Object { $_.Extension -eq ".txt" -and $_.LastWriteTime -lt $cutoffDate }

Write-Host "Cutoff date: $cutoffDate"
Write-Host "Files older than 7 days:"
$oldFiles | ForEach-Object { Write-Host " - $($_.Name) (last modified $($_.LastWriteTime))" }

$oldFiles | Copy-Item -Destination $backupFolder -WhatIf