
$edgeApplication = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$edgeCachePath  = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\Cache_Data"
$edgeProcess = msedge
$adminLog = "$env:USERPROFILE\Admin_Logs"
$cacheRemovedLog = Join-Path $adminLog "cleared_cache.log" 
$date = Get-Date


function Validate-Edge-Application {

    if(!(Test-Path -Path $edgeApplication)){
        Write-Host "Edge Application path does not exist"
        return
    } 
}

function Validate-Cache-Path {

    if(!(Test-Path -Path $edgeCachePath)){
        Write-Host "Edge Cache path does not exist"
        return
    } 
}

function Validate-Log-Path {
    
    if(-not(Test-Path $adminLog)){
        try
        {
            New-Item -ItemType Directory -Path $adminLog
            Write-Host "Admin Log Folder has been created"
                
        }
        catch
        {
            Write-Output "An error has occured: $_"
        }    
    }
}


function Kill-Edge-Process {

    if(Get-Process -Name $edgeProcess -ErrorAction SilentlyContinue){
        try
        {
            Stop-Process -Name $edgeProcess -Force -ErrorAction Stop
            Write-Host "Edge Browser has been terminated" 
        }
        catch
        {
            Write-Host "An error has occured $_"
        }
    }
}

function Clear-Edge-Cache {
        
        try
        {
            Get-ChildItem -Path $edgeCachePath -Recurse | Remove-Item -Force -Recurse -ErrorAction Stop
            Write-Host "Edge cache has been cleared"
            "$date - Edge cache has been cleared" | Out-File -FilePath $cacheRemovedLog -Append
                
        }
        catch
        {
            Write-Host "An error has occured $_"
            "$date - An error has occured $_" | Out-File -FilePath $cacheRemovedLog -Append
        }                
 }
    

Validate-Edge-Application
Validate-Cache-Path
Validate-Log-Path
Kill-Edge-Process
Clear-Edge-Cache


    
#### Notes ####
    
# Recurse -> looks inside every single subfolder for files
# Force -> it allows you to delete hidden files, system files, and read-only files without PowerShell stopping to ask you for permission
        
