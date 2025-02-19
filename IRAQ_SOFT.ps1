if ($ExecutionContext.SessionState.LanguageMode.value__ -ne 0) {
    Write-Host "Windows PowerShell is not running in Full Language Mode." -ForegroundColor Red
    Write-Host "Help - https://massgrave.dev/fix_powershell" -ForegroundColor White -BackgroundColor Blue
    return
}

function CheckInternet {
    try {
        $ping = Test-Connection -ComputerName google.com -Count 1 -Quiet
        if (-not $ping) {
            Write-Host "No internet connection detected. Aborting!" -ForegroundColor Red
            exit
        }
    } catch {
        Write-Host "Failed to check internet connection. Proceeding anyway..." -ForegroundColor Yellow
    }
}

function CheckFile { 
    param ([string]$FilePath) 
    if (-not (Test-Path $FilePath)) { 
        Write-Host "Failed to create file in temp folder, aborting!" -ForegroundColor Red
        exit
    } 
}

CheckInternet

$URL = "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/index.cmd"
$FilePath = "$env:TEMP\IRAQ_SOFT.ps1"

try {
    Invoke-WebRequest -Uri $URL -OutFile $FilePath -UseBasicParsing
    Write-Host "File downloaded successfully to: $FilePath" -ForegroundColor Green
} catch {
    Write-Host "Failed to download the file. Check the URL or your connection." -ForegroundColor Red
    exit
}

CheckFile $FilePath

# Verify script integrity (Optional: Add hash verification if needed)
# Example: $expectedHash = "YOUR_EXPECTED_HASH"
# $fileHash = (Get-FileHash -Path $FilePath -Algorithm SHA256).Hash
# if ($fileHash -ne $expectedHash) { Write-Host "Hash mismatch! Aborting." -ForegroundColor Red; exit }

Write-Host "Executing the script..." -ForegroundColor Cyan
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$FilePath`"" -Wait

# Cleanup (optional)
Remove-Item -Path $FilePath -Force
Write-Host "Cleanup completed." -ForegroundColor Green
