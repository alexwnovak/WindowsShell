#==================================================================================================
# GitHub Profile
#==================================================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Start-SshAgent -Quiet

. 'C:\Shell\PowerShell\aliases.ps1'
. 'C:\Shell\PowerShell\speech.ps1'

. 'C:\Shell\PowerShell\Get-ChildItem-Color.ps1'

Set-Alias ls Get-ChildItem-Color -option AllScope -Force
Set-Alias dir Get-ChildItem-Color -option AllScope -Force

#==================================================================================================
# [Eof]
#==================================================================================================
