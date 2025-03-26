# Comando para agregar el bucket 'main' si no está ya agregado
$BucketCheckCommand = "scoop bucket list | Select-String 'main'"
$BucketExists = Invoke-Expression $BucketCheckCommand

if (-not $BucketExists) {
    Write-Host "Agregando el bucket 'main' de Scoop..." -ForegroundColor Yellow
    try {
        scoop bucket add main
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Error al agregar el bucket 'main' de Scoop."
            exit 1
        }
        Write-Host "Bucket 'main' agregado exitosamente." -ForegroundColor Green
    } catch {
        Write-Error "Ocurrió un error al intentar agregar el bucket 'main': $($_.Exception.Message)"
        exit 1
    }
} else {
    Write-Host "El bucket 'main' de Scoop ya está agregado." -ForegroundColor Green
}

# Comando para instalar Gradle
$InstallCommand = "scoop install main/gradle"

# Ejecutar el comando Scoop para instalar Gradle
Write-Host "Iniciando la instalación de Gradle usando Scoop..." -ForegroundColor Yellow
try {
    scoop install main/gradle
    if ($LASTEXITCODE -ne 0) {
        Write-Error "La instalación de Gradle falló."
        exit 1
    }
    Write-Host "La instalación de Gradle se ha completado." -ForegroundColor Green
} catch {
    Write-Error "Ocurrió un error al ejecutar el comando Scoop para instalar Gradle: $($_.Exception.Message)"
    exit 1
}

Write-Host "Script finalizado."
exit 0