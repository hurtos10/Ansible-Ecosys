# Script para ejecutar los scripts .ps1 en orden ascendente de "stage"
# Detiene la ejecución si algún script falla.

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Definir los nombres de los scripts en el orden deseado
$scripts = @(
    "stage0-winget.ps1",
    "stage1-jdk.ps1",
    "stage2-intellij.ps1",
    "stage3-scoop.ps1",
    "stage4-gradle.ps1",
    "stage5-maven.ps1"
)

foreach ($scriptName in $scripts) {
    $scriptPath = Join-Path $scriptDir $scriptName
    Write-Host "Ejecutando script: $($scriptPath)" -ForegroundColor Cyan

    try {
        . $scriptPath # El punto antes de la ruta ejecuta el script en el ámbito actual
        Write-Host "Script '$scriptName' ejecutado exitosamente." -ForegroundColor Green
    }
    catch {
        Write-Error "Error al ejecutar el script '$scriptName': $($_.Exception.Message)"
        Write-Host "La ejecución se ha detenido debido a un error." -ForegroundColor Red
        exit 1 # Indica que el script principal terminó con un error
    }
}

Write-Host "Todos los scripts se han ejecutado exitosamente." -ForegroundColor Green
exit 0 # Indica que el script principal terminó sin errores