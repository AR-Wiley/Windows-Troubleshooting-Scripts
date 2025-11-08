function Kill-Adobe-Process {

      $adobe = (Get-Process -Name AcroRd32).ProcessName

      if($adobe.Length -gt 0){  
        $adobeID = (Get-Process -Name AcroRd32).Id

        forEach($i in $adobeID){
            Try {
                Stop-Process -Id $i -Force
                Write-Host "Process ID $i has been terminated" -BackgroundColor Green -ForegroundColor White
            } Catch{
                Write-Host "Failed to terminate Process ID $i" -BackgroundColor Red -ForegroundColor Black
            }
        }
    } else {
        Write-Host "No Adobe Processes Running"               
    } 
} 