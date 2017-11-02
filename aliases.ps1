#==================================================================================================
# Functions
#==================================================================================================

function Git-AddAll                         { git add -A }
function Git-AddPartial                     { git add -p $args }
function Git-Branch                         { git branch }
function Git-Checkout                       { git checkout $args }
function Git-CheckoutPartial                { git checkout -p -- $args }
function Git-Commit                         { git commit }
function Git-CommitAll                      { git add -A
                                              git commit -m $args }
function Git-CommitFixup                    { git commit --fixup $args }
function Git-CommitAmend                    { git commit --amend }
function Git-Diff                           { git diff }
function Git-DiffStaged                     { git diff --staged }
function Git-DiffTool                       { git difftool }
function Git-Fetch                          { git fetch }
function Get-FetchPrune                     { git fetch --prune }
function Git-GetStatus                      { git status }
function Git-Log                            { git log --decorate --graph --oneline }
function Git-LogAhead                       { git log --oneline origin..head }
function Git-LogAll                         { git log --all --decorate --graph --oneline }
function Git-NewBranch                      { git checkout -b $args }
function Git-Pull                           { git pull }
function Git-PushOriginHead                 { git push origin HEAD }
function Git-PushWithForce                  { git push -f origin HEAD }
function Git-PushWithUpstream               { git push -u origin HEAD }
function Git-RebaseAbort                    { git rebase --abort }
function Git-RebaseContinue                 { git rebase --continue } 
function Git-RebaseOriginDevelop            { git rebase origin/develop }
function Git-RebaseOriginMaster             { git rebase origin/master }
function Git-RebaseInteractive              { git rebase -i --autosquash master }
function Git-RebaseInteractiveDevelop       { git rebase -i --autosquash develop }
function Git-RebaseInteractiveOriginDevelop { git rebase -i --autosquash origin/develop }
function Git-RebaseMaster                   { git rebase master }   
function Git-ResetHard                      { git reset --hard }
function Git-ResetHeadOne                   { git reset head~ }
function Git-Show                           { git show $args }
function Git-SubmoduleUpdate                { git submodule update --init --recursive }
function Git-Wip                            { git add -A
                                              git commit -m "WIP" }

#==================================================================================================
# Aliases
#==================================================================================================

Set-Alias amend Git-CommitAmend
Set-Alias co Git-Commit
Set-Alias fixup Git-CommitFixup
Set-Alias gaa Git-AddAll
Set-Alias gap Git-AddPartial
Set-Alias gb Git-Branch
Set-Alias gbr Git-NewBranch
Set-Alias gca Git-CommitAll
Set-Alias gco Git-Checkout
Set-Alias gcp Git-CheckoutPartial
Set-Alias gdf Git-Diff
Set-Alias gds Git-DiffStaged
Set-Alias gdt Git-DiffTool
Set-Alias gf Git-Fetch
Set-Alias gfp Get-FetchPrune
Set-Alias gla Git-LogAhead
Set-Alias glg Git-Log
Set-Alias glo Git-LogAll
Set-Alias grd Git-RebaseInteractiveDevelop
Set-Alias gri Git-RebaseInteractive
Set-Alias griod Git-RebaseInteractiveOriginDevelop
Set-Alias gpu Git-Pull
Set-Alias gra Git-RebaseAbort
Set-Alias grc Git-RebaseContinue
Set-Alias grh Git-ResetHard
Set-Alias grm Git-RebaseMaster
Set-Alias grod Git-RebaseOriginDevelop
Set-Alias grom Git-RebaseOriginMaster
Set-Alias gs Git-GetStatus
Set-Alias gsh Git-Show
Set-Alias gsu Git-SubmoduleUpdate
Set-Alias pop Git-ResetHeadOne
Set-Alias push Git-PushOriginHead
Set-Alias pushf Git-PushWithForce
Set-Alias pushu Git-PushWithUpstream
Set-Alias wip Git-Wip

#==================================================================================================
# [Eof]
#==================================================================================================
