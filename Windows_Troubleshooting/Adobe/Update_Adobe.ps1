function Update-Adobe {

    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            Write-Host 'Not running as admin'
            return
    } else {
        Write-Host 'Running as admin'
    }

    $adobeUpdateUrl = "https://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/2300920053/AcroRdrDC2300920053_en_US.exe"

    $installerPath = "$env:TEMP\AcroRdrDC_Update.exe"

    Invoke-WebRequest -Uri $adobeUpdateUrl -OutFile $installerPath

    Try {
        Start-Process -FilePath $installerPath -ArgumentList "/sAll /rs /msi EULA_ACCEPT=YES" -Wait   
        Write-Host "Adobe successfully updated"  -BackgroundColor Green -ForegroundColor White
    } Catch {
        Write-Host "Adobe failed to install" -BackgroundColor Red -ForegroundColor Black
    }

    Try {
        Remove-Item -Path $installerPath -Force
        Write-Host: "Installer successfully removed"  -BackgroundColor Green -ForegroundColor White
    } Catch {
        Write-Host "Installer failed to be removed" -BackgroundColor Red -ForegroundColor Black
    }
}

 