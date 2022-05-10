$env:EDITOR = 'nvim'

Invoke-Expression (&starship init powershell)

# support light theme
Set-PSReadLineOption -Colors @{
  "Default"            = [ConsoleColor]::Black
  "Command"            = [ConsoleColor]::"DarkBlue"
  "Comment"            = [ConsoleColor]::"Yellow"
  "ContinuationPrompt" = [ConsoleColor]::"Green"
  "Emphasis"           = [ConsoleColor]::"DarkCyan"
  "Error"              = [ConsoleColor]::"DarkRed"
  "Keyword"            = [ConsoleColor]::"DarkMagenta"
  "Member"             = [ConsoleColor]::"White"
  "Number"             = [ConsoleColor]::"White"
  "Operator"           = [ConsoleColor]::"Green"
  "Parameter"          = [ConsoleColor]::"Blue"
  "String"             = [ConsoleColor]::"DarkGreen"
  "Type"               = [ConsoleColor]::"DarkMagenta"
  "Variable"           = [ConsoleColor]::"Red"
}

Set-Alias vi nvim
Set-Alias vim nvim

Import-Module -Name Terminal-Icons
# Terminal icons theme don't support light theme
# issue here: https://github.com/devblackops/Terminal-Icons/issues/69
Set-TerminalIconsTheme -DisableColorTheme

Import-Module -Name PSFzf
function c() {
  Invoke-FuzzySetLocation
}

function v() {
  Invoke-FuzzyEdit
}
function f() {
  Invoke-FuzzyEdit
}

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
set-PSFzfOption -PSReadlineChordReverseHistory  'ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

Import-Module -Name Recycle
Set-Alias t Remove-ItemSafely

function clear() { Clear-Host }
function cler() { Clear-Host }
function clar() { Clear-Host }
function clr() { Clear-Host }

function e() { Exit }
function q() { Exit }

function push() { git push }

function pull() { git pull }

function st() { git status -sb }

function dv() { git difftool }

function gl() { git log --oneline | head -n 5 }

function autoCommit() {
  git add .
  git commit -m "[👌Auto commit] $(curl -s whatthecommit.com/index.txt)"
  git pull
  git push
}
Set-Alias ok autoCommit

function ins() {
  $app = $args[0]
  winget install --accept-package-agreements --accept-source-agreements $app
}

function uins() {
  $app = $args[0]
  winget uninstall $app
}

function inss() {
  $app = $args[0]
  winget search $app
}

function ya() {
  Invoke-FuzzyScoop
}

function Get-ChildItem-Hidden() { Get-ChildItem -Force }
Set-Alias ls Get-ChildItem-Hidden
Set-Alias l Get-ChildItem-Hidden

function Get-ChildItem-Hidden-Wide() { Get-ChildItem -Force | Format-Wide }
Set-Alias la Get-ChildItem-Hidden-Wide

function .. { Set-location .. ; la }

function ... { Set-location .. ; Set-location .. ; la }

function cd() {
  $path = $args[0]
  Set-location -Path $path
  la
}

function mk() {
  $dir = $args[0]
  mkdir $dir
  Set-location -Path $dir
}

function tmp() {
  Set-location -Path $env:temp
  la
}

function dow() {
  Set-location -Path $env:USERPROFILE\Downloads
  la
}

function doc() {
  Set-location -Path $env:USERPROFILE\Documents\
  la
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function update() {
  winget upgrade --all
  scoop update *
}

function browserDaily() {
  Start-Process "https://mail.google.com/mail/u/0/#inbox"
  Start-Process "https://mail.google.com/mail/u/1/#inbox"
  Start-Process "https://www.youtube.com/feed/subscriptions"
  Start-Process "https://feeder.co/reader"
  Start-Process "https://animevietsub.tv/"
  Start-Process "https://subnhanh.net/"
  Start-Process "https://discord.com/channels/@me"
  Start-Process "https://facebook.com/"
}

function hi() {
  browserDaily
  update
}
