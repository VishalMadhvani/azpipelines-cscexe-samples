$process = Start-Process -FilePath "cmd.exe" -ArgumentList "/c", "build.bat" -RedirectStandardOutput "stdout.log" -PassThru -Wait
if ($process.ExitCode -ne 0) {
    Get-Content -Path "stdout.log" -Raw | Write-Error
    throw
} else {
    Get-Content -Path "stdout.log" -Raw | Write-Output
}