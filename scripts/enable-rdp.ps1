cmd /c "netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389"
cmd /c "reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f"
cmd /c "reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer /t REG_DWORD /d 0 /f"
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName localhost -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)
