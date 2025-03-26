# Script para instalar IntelliJ IDEA Community Edition usando Winget
# Asume que Winget ya está instalado.

# Comando para instalar IntelliJ IDEA Community Edition
$InstallCommand = "winget install -e --id JetBrains.IntelliJIDEA.Community --accept-source-agreements --accept-package-agreements"

# Ejecutar el comando Winget
Write-Host "Iniciando la instalación de IntelliJ IDEA Community Edition usando Winget..." -ForegroundColor Yellow
try {
    Invoke-Expression $InstallCommand
    Write-Host "La instalación de IntelliJ IDEA Community Edition se ha completado." -ForegroundColor Green
} catch {
    Write-Error "Ocurrió un error al ejecutar el comando Winget: $($_.Exception.Message)"
    exit 1
}

Write-Host "Script finalizado."
exit 0