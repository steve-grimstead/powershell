```powershell
Net stop w32time
Net stop w32time
W32tm  /unregister
W32tm /register
w32tm /config /manualpeerlist:"time.windows.com,0x8 pool.ntp.org,0x8" /reliable:yes /syncfromflags:manual
Net start w32time
w32tm /resync /nowait
w32tm /query /status
w32tm /query /peers
```
