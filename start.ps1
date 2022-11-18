#Remove-Item -Path "D:\Love Games\Final Project CS50x\game.zip" -Force
Remove-Item -Path "D:\Love Games\Final Project CS50x\game.love" -Force

$compress = @{
    Path = "D:\Love Games\Final Project CS50x\main.lua" , "D:\Love Games\Final Project CS50x\assets", "D:\Love Games\Final Project CS50x\concord"
    CompressionLevel = "Fastest"
    DestinationPath = "D:\Love Games\Final Project CS50x\game.zip"
  }

Compress-Archive @compress

Rename-Item -Path "D:\Love Games\Final Project CS50x\game.zip" -NewName "game.love"

Invoke-Item "D:\Love Games\Final Project CS50x\game.love"

#Read-Host -Prompt "Press Enter to exit"