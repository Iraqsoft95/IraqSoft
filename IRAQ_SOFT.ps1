$ErrorActionPreference = "Stop"

# Check if the PowerShell is in Full Language Mode
if ($ExecutionContext.SessionState.LanguageMode -ne 'FullLanguage') {
    Write-Host "PowerShell is not in Full Language Mode. Exiting script!" -ForegroundColor Red
    exit
}

write-host
Write-Host -ForegroundColor Green "Welcome To IRAQ SOFT"
write-host

# Check if TLS 1.2 is enabled, and enable it if not
if ([Net.ServicePointManager]::SecurityProtocol -notcontains [Net.SecurityProtocolType]::Tls12) {
    Write-Host "Enabling TLS 1.2 protocol..." -ForegroundColor Green
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
}

$DownloadURL1 = 'https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/index.cmd'

$URLs = @($DownloadURL1)
$RandomURL1 = Get-Random -InputObject $URLs

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
    if ($response.StatusCode -eq 200) {
        Write-Host "File downloaded successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to download the file. Response status: $($response.StatusCode)" -ForegroundColor Red
        exit
    }
} catch {
    Write-Host "Failed to download the file: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

$DownloadFolder = "C:\Users\Public\Documents\IRAQSOFT_TOOL"

if (-Not (Test-Path -Path $DownloadFolder)) {
    New-Item -ItemType Directory -Path $DownloadFolder
}

$rand = [Guid]::NewGuid().Guid
$FilePath = "$DownloadFolder\MAJ_$rand.cmd"

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $res
