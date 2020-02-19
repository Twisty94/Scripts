
RD /S /Q "%WinDir%\System32\GroupPolicy"
pause
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
pause
"C:\Temp\msilog.log"
gpupdate /force


