$global:CustomPromptSettings = New-Object PSObject -Property @{
   PathBackgroundColor              = [ConsoleColor]::DarkGray
   PathForegroundColor              = [ConsoleColor]::White
      
   BranchBackgroundColor            = [ConsoleColor]::Magenta
   BranchForegroundColor            = [ConsoleColor]::Black
   BranchBehindBackgroundColor      = [ConsoleColor]::Red
   BranchBehindForegroundColor      = [ConsoleColor]::Black
   BranchAheadBackgroundColor       = [ConsoleColor]::Green
   BranchAheadForegroundColor       = [ConsoleColor]::Black
   BranchDivergedBackgroundColor    = [ConsoleColor]::Yellow
   BranchDivergedForegroundColor    = [ConsoleColor]::Black
   
   PromptLineForegroundColor        = [ConsoleColor]::White
   
   ChevronChar                      = ""
   ChangesChar                      = emoji "RADIO BUTTON"
   PromptLineChar                   = emoji "SLICE OF PIZZA"
}

function Prompt
{
   $Global:GitStatus = Get-GitStatus
   $s = $global:CustomPromptSettings
   $status = Get-GitStatus
   
   $branchForeground = $s.BranchForegroundColor
   $branchBackground = $s.BranchBackgroundColor
   
   if ( $status.AheadBy -gt 0 -and $status.BehindBy -gt 0 ) {
      $branchForeground = $s.BranchDivergedForegroundColor
      $branchBackground = $s.BranchDivergedBackgroundColor    
   }
   elseif ( $status.BehindBy -gt 0 )
   {
      $branchForeground = $s.BranchBehindForegroundColor
      $branchBackground = $s.BranchBehindBackgroundColor 
   }
   elseif ( $status.AheadBy -gt 0 )
   {
      $branchForeground = $s.BranchAheadForegroundColor
      $branchBackground = $s.BranchAheadBackgroundColor
   }
      
   Write-Host " $($ExecutionContext.SessionState.Path.CurrentLocation) " -NoNewLine -Foreground $s.PathForegroundColor -Background $s.PathBackgroundColor
   
   if ( $status )
   {
      Write-Host $s.ChevronChar -Foreground $s.PathBackgroundColor -Background $branchBackground -NoNewLine
      Write-Host " $($status.Branch)" -NoNewLine -Foreground $s.BranchForegroundColor -Background $branchBackground
      
      if ( $status.HasUntracked -or $status.HasIndex )
      {
         Write-Host " $($s.ChangesChar) " -NoNewLine -Foreground $branchForeground -Background $branchBackground
      }
      else
      {
         Write-Host " " -NoNewLine -Background $branchBackground
      }
      
      Write-Host $s.ChevronChar -Foreground $branchBackground
   }
   else
   {
      Write-Host $s.ChevronChar -Foreground $s.PathBackgroundColor
   }

   Write-Host $s.PromptLineChar -Foreground $s.PromptLineForegroundColor -NoNewLine

#   $origLastExitCode = $LASTEXITCODE
#   Write-Host "[" -NoNewline -Foreground DarkGray
#   
#   $pathParts = $ExecutionContext.SessionState.Path.CurrentLocation.Path.Split( '\\' );
#   $len = $pathParts.Length;
#   
#   for ( $i = 0; $i -lt $len - 1; $i++ )
#   {
#      Write-Host "$($pathParts[$i])" -NoNewline -Foreground Blue
#      Write-Host "\" -NoNewline -Foreground DarkGray
#   }
#
#   Write-Host "$($pathParts[$len - 1])" -NoNewline -Foreground Blue
#   Write-VcsStatus
#   Write-Host ">" -Foreground DarkGray
#   $LASTEXITCODE = $origLastExitCode
#
#   if ( $global:promptToggle -eq 1 )
#   {
#      Write-Host "(" -NoNewline -Foreground DarkYellow
#      Write-Host "⌐■‿■" -NoNewline -Foreground Yellow
#      Write-Host ")つ" -NoNewline -Foreground DarkYellow
#      $global:promptToggle = 0
#   }
#   else
#   {
#      Write-Host "(" -NoNewline -Foreground DarkYellow
#      Write-Host "⌐■‿■" -NoNewline -Foreground Yellow
#      Write-Host ")∩ " -NoNewline -Foreground DarkYellow
#      $global:promptToggle = 1
#   }
    
   #if ( $global:promptToggle -eq 1 )
   #{
   #   Write-Host "(\/) (" -NoNewline -Foreground Red
   #   Write-Host "o" -NoNewline -Foreground Cyan
   #   Write-Host ",," -NoNewline -Foreground Red
   #   Write-Host "o" -NoNewline -Foreground Cyan
   #   Write-Host ") (|) " -NoNewline -Foreground Red
   #   $global:promptToggle = 0
   #}
   #else
   #{
   #   Write-Host "(|)  (" -NoNewline -Foreground Red
   #   Write-Host "o" -NoNewline -Foreground Cyan
   #   Write-Host ",," -NoNewline -Foreground Red
   #   Write-Host "o" -NoNewline -Foreground Cyan
   #   Write-Host ") (\/)" -NoNewline -Foreground Red
   #   $global:promptToggle = 1
   #}
   " "
}
