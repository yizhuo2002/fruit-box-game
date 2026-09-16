# Start a local server for phone testing on your LAN.
# Usage: .\serve.ps1
# Then open http://<your-pc-ip>:8080 on your phone (same Wi-Fi).

$port = 8080
$ip = (Get-NetIPAddress -AddressFamily IPv4 |
  Where-Object { $_.IPAddress -notlike "127.*" -and $_.PrefixOrigin -ne "WellKnown" } |
  Select-Object -First 1 -ExpandProperty IPAddress)

Write-Host ""
Write-Host "Fruit Box local server" -ForegroundColor Green
Write-Host "  PC:     http://localhost:$port"
if ($ip) { Write-Host "  Phone:  http://${ip}:$port" -ForegroundColor Cyan }
Write-Host ""
Write-Host "Press Ctrl+C to stop."
Write-Host ""

python -m http.server $port
