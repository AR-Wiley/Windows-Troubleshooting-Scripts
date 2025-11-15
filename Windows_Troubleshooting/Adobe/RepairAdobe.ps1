function RepairAdobe {

    $AdobePath = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader"
    $ExePath = Join-Path $AdobePath "AcroRd32.exe"

    if(-not(Test-Path $AdobePath)) {
        Write-Host "Path for Adobe does not exist"
        return
    }

    if(-not(Test-Path $ExePath)) {
        Write-Host "Executable for Adobe does not exist"
        return
    } else {
        Try{	
	        Write-Host "Starting Adobe Repair"
            & $ExePath "/repair"
            Write-Host "Adobe Repair succesfully completed"
        } catch {
            Write-Host "ERROR MESSAGE:" -ForegroundColor Red
            Write-Host $_.Exception.Message 
        }
    }
}

RepairAdobe