
$adminLog = "$env:USERPROFILE\Admin_Logs"


$edgeApplicaiton = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

$edgeCachePath = "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\Cache\Cache_Data\" 


function Validate-Admin-Log{

    if(-not(Test-Path $adminLog)){
        try
        {
            New-Item -ItemType Directory -Path $adminLog
                
        }
        catch
        {
            Write-Output "An error has occured: $_"
        }
    
    }
}

function Validate-Edge {
    


}

