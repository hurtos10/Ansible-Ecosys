# Script para verificar e instalar Winget

# Verificar si Winget ya está instalado
$WingetPath = Get-Command winget -ErrorAction SilentlyContinue

if ($WingetPath) {
    Write-Host "Winget ya está instalado en la siguiente ubicación:" $WingetPath.Source -ForegroundColor Green
} else {
    Write-Host "Winget no está instalado. Iniciando la instalación..." -ForegroundColor Yellow

    # Descargar el instalador de Winget desde GitHub
    $InstallerUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $InstallerPath = "$env:TEMP\WingetInstaller.msixbundle"

    try {
        Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath
        Write-Host "Instalador de Winget descargado correctamente en:" $InstallerPath -ForegroundColor Green

        # Instalar Winget usando Add-AppxPackage
        Add-AppxPackage -Path $InstallerPath

        # Esperar unos segundos para que la instalación se complete
        Start-Sleep -Seconds 10

        # Verificar nuevamente si Winget se instaló correctamente
        $WingetPath = Get-Command winget -ErrorAction SilentlyContinue
        if ($WingetPath) {
            Write-Host "Winget instalado correctamente en:" $WingetPath.Source -ForegroundColor Green
        } else {
            Write-Error "La instalación de Winget falló. Por favor, revise los logs o intente la instalación manualmente desde:" $InstallerUrl
        }
    } catch {
        Write-Error "Ocurrió un error durante la descarga o instalación de Winget:" $_.Exception.Message
    } finally {
        # Eliminar el archivo del instalador temporal
        if (Test-Path $InstallerPath) {
            Remove-Item $InstallerPath -Force
        }
    }
}