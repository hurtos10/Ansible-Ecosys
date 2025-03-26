# Script para instalar Eclipse Adoptium Temurin 21 JDK usando Winget (asumiendo que Winget ya está instalado)

# Comando para instalar Eclipse Adoptium Temurin 21 JDK
$InstallCommand = "winget install -e --id EclipseAdoptium.Temurin.21.JDK --accept-source-agreements --accept-package-agreements"

# Ejecutar el comando Winget
Write-Host "Iniciando la instalación de Eclipse Adoptium Temurin 21 JDK usando Winget..." -ForegroundColor Yellow
try {
    Invoke-Expression $InstallCommand
    Write-Host "La instalación de Eclipse Adoptium Temurin 21 JDK se ha completado." -ForegroundColor Green
} catch {
    Write-Error "Ocurrió un error al ejecutar el comando Winget: $($_.Exception.Message)"
    exit 1
}

Write-Host "Script finalizado."
exit 0