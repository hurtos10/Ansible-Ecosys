# --- Stage 1: Instalación de Scoop ---
Write-Host "`n--- Ejecutando Stage 1: Scoop ---" -ForegroundColor Yellow
try {
    # Verificar si Scoop ya está instalado
    $ScoopInstalled = Get-Command scoop -ErrorAction SilentlyContinue
    if ($ScoopInstalled) {
        Write-Host "Scoop ya está instalado. Omitiendo la instalación." -ForegroundColor Green
    } else {
        Write-Host "Scoop no está instalado. Iniciando la instalación..." -ForegroundColor DarkYellow
        Write-Host "Estableciendo la política de ejecución para el usuario actual a RemoteSigned (si no está ya establecida)." -ForegroundColor DarkYellow
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

        Write-Host "Descargando e instalando Scoop..." -ForegroundColor DarkYellow
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
        if ($LASTEXITCODE -ne 0) {
            Write-Error "La instalación de Scoop falló."
            exit 1
        }
        Write-Host "Stage 3 (Scoop) completado exitosamente." -ForegroundColor Green
    }
} catch {
    Write-Error "Ocurrió un error al intentar verificar o instalar Scoop: $($_.Exception.Message)"
    exit 1
}
