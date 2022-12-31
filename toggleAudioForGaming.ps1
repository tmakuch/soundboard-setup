If (! (Get-Module -Name "AudioDeviceCmdlets" -ListAvailable)) {
#    The version in Powershell Gallery is currently Broken so need to do a manual download/install
#    Install-Module -Name AudioDeviceCmdlets -Force -Verbose  
#    get-module -Name "AudioDeviceCmdlets" -ListAvailable | Sort-Object Version | select -last 1 | Import-Module -Verbose

    Write-Output "Missing AdioDeviceCmdlets, downloading them"
 
    $url='https://github.com/frgnca/AudioDeviceCmdlets/releases/download/v3.1/AudioDeviceCmdlets.dll'
    $location = ($profile | split-path)+ "\Modules\AudioDeviceCmdlets\AudioDeviceCmdlets.dll"
    New-Item "$($profile | split-path)\Modules\AudioDeviceCmdlets" -Type directory -Force | Out-Null
 
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    (New-Object System.Net.WebClient).DownloadFile($url, $location)
}
 
If (! (Get-Module -Name "AudioDeviceCmdlets")) {
    Write-Output "AdioDeviceCmdlets is available, but not loaded - loading them"
    Get-Module -Name "AudioDeviceCmdlets" -ListAvailable | Sort-Object Version | Select-Object -last 1 | Import-Module -Verbose
}

$currentAudio = Get-AudioDevice -List | Where-Object Type -like "Playback" | Where-Object Default -EQ True | Select-Object -ExpandProperty "Name"

If ($currentAudio -like "DELL*") {
    Get-AudioDevice -List | Where-Object Type -like "Playback" | Where-Object name -like "Voicemeeter Aux*" | Set-AudioDevice
    Write-Output "Audio output set to Voicemeeter AUX"

    Write-Output "Starting Mixer"
    Start-Process -FilePath "voicemeeterpro.exe" -WorkingDirectory "C:\Program Files (x86)\VB\Voicemeeter"

    Write-Output "Starting Soundboard"
    Start-Process -FilePath "DCSB.exe" -WorkingDirectory "C:\Program Files (x86)\Soundboard"
} else {
    Get-AudioDevice -List | Where-Object Type -like "Playback" | Where-Object name -like "DELL*" | Set-AudioDevice
    Write-Output "Audio output set to Dell"
}