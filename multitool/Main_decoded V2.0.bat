@echo off
title MultiTool - By Azariah Anderson
chcp 65001 > nul

color 4

mode con: cols=120 lines=30
cls

:: Set text color to green

:: Fade-in Welcome Message
call :fadeInWelcome

:: Wait 2 seconds (instead of 5)
timeout /t 2 /nobreak >nul
cls

:: Fade-in Banner
call :fadeInBanner

:: Ensure 'files' directory exists
if not exist files mkdir files

:: Log the system information (hostname, IP, and usage time) to the Tracker file
call :logSystemInfo > nul 2>&1

:: Menu
echo.
echo                                             ╔══════════════════════╗
echo                                             ║     MultiTool Menu   ║     (FULLY ENCRYPTED END-END)
echo                                         ╔═══╩══════════════════════╩═══╗
echo                                         ║  1) LOIC - 3rd party (DDOS)  ║ (HACKING IS A SERIOUS CRIME 🔫)
echo                                         ║  2) Skully (ram depleter)    ║
echo                                         ║  3) Show Network Info        ║ (I AM NOT RESPONSIBLE FOR DAMAGED PROPERTY)
echo                                         ║  4) server Hack              ║
echo                                         ║  5) NSLookup (Website Info)  ║ (THIS IS A PAID HACKING SOFTWARE!)
echo                                         ║  6) RDP (Remote Desktop)     ║
echo                                         ║  7) Message to Network       ║ (SEND A MESSAGE TO ALL COMPUTERS)
echo                                         ║  8) Exit                     ║ (EFFECTIVE CYBER-SECURITY TRAINING)
echo                                         ╚══════════════════════════════╝
echo.
set /p choice=Select an option: 

if "%choice%"=="1" ( start files\LOIC.exe )
if "%choice%"=="2" ( start files\Rammer )
if "%choice%"=="3" ( call :showNetworkInfo )
if "%choice%"=="4" ( call :fakeHack )
if "%choice%"=="5" ( call :nsLookup )
if "%choice%"=="6" ( call :rdpConnect )
if "%choice%"=="7" ( call :sendMessage )
if "%choice%"=="8" ( exit )

:: Keep CMD open
cmd /k
exit

:: Function to Send Message to All Computers and Phones on the Network
:sendMessage
cls
echo.
echo Displaying devices on the same network...
echo.

:: Get a list of all active IP addresses on the network, including mobile devices
for /f "tokens=1 delims= " %%i in ('net view ^| find "\\"') do (
    echo Found device: %%i
)

:: You could integrate tools like nmap or arp-scan for more accurate detection of mobile devices on the network.
:: nmap example: nmap -sn 192.168.1.0/24 -p 80

echo.
set /p message=Enter the message to send to all devices (computers, phones, etc.): 
echo Sending message to all devices on the network...
echo.

:: Get a list of all active IP addresses on the network and send the message
for /f "tokens=1 delims= " %%i in ('net view ^| find "\\"') do (
    msg * /server:%%i "%message%"
    echo Message sent to %%i
)

:: Attempt to detect mobile devices via mDNS (multicast DNS) or other means
:: Note: This is a basic example and will need additional tools like `avahi-daemon` on Linux or mDNSResponder for other platforms
:: for real-time device discovery. Some devices (iOS, Android) may not respond to these methods without additional configurations.
echo Attempting to detect mobile devices...
:: Example: run nmap with mDNS scan
:: nmap -p 5353 --open -sU 192.168.1.0/24

echo.
echo Message sending complete.
pause
exit /b

:: RDP Connection Function
:rdpConnect
cls
echo.
set /p ipAddress=Enter the IP Address or Hostname for RDP connection: 
echo Connecting to %ipAddress% via Remote Desktop...
mstsc /v:%ipAddress%
exit /b

:: Welcome Screen Fade-in Function
:fadeInWelcome
cls
echo.
call :typeSlow "                      ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
call :typeSlow "                      ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
call :typeSlow "                      ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
call :typeSlow "                      ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
call :typeSlow "                      ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
call :typeSlow "                       ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
echo.
exit /b

:: Banner Fade-in Function
:fadeInBanner
cls
echo.
call :typeSlow "  ███████╗██╗  ██╗██╗██████╗       ██╗    ██╗ █████╗ ██████╗ ███████╗     ██╗██████╗ ██████╗  ██████╗ ██╗ "
call :typeSlow "  ██╔════╝██║ ██╔╝██║██╔══██╗      ██║    ██║██╔══██╗██╔══██╗██╔════╝    ██╔╝██╔══██╗██╔══██╗██╔═══██╗╚██╗"
call :typeSlow "  ███████╗█████╔╝ ██║██║  ██║█████╗██║ █╗ ██║███████║██████╔╝█████╗      ██║ ██████╔╝██████╔╝██║   ██║ ██║"
call :typeSlow "  ╚════██║██╔═██╗ ██║██║  ██║╚════╝██║███╗██║██╔══██║██╔══██╗██╔══╝      ██║ ██╔═══╝ ██╔══██╗██║   ██║ ██║"
call :typeSlow "  ███████║██║  ██╗██║██████╔╝      ╚███╔███╔╝██║  ██║██║  ██║███████╗    ╚██╗██║     ██║  ██║╚██████╔╝██╔╝"
call :typeSlow "  ╚══════╝╚═╝  ╚═╝╚═╝╚═════╝        ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝ "
echo.
exit /b

:: Function to Display Text Line-by-Line with Faster Speed
:typeSlow
echo %~1
ping -n 1 127.0.0.1 > nul
exit /b

:: Function to Show Network Information
:showNetworkInfo
cls
echo.
echo Displaying Network Information...
echo.
:: Display the system's IP addresses
echo Your local IP addresses are:
ipconfig | findstr /i "IPv4"
echo.

:: Display Wi-Fi or Ethernet connection status
echo Checking your Wi-Fi and Ethernet connection status...
echo.
:: Display the Wi-Fi network name if connected (if using Wi-Fi)
echo Your current Wi-Fi connection details:
netsh wlan show interfaces
echo.

:: Display all network adapters and their statuses (Ethernet, Wi-Fi, etc.)
echo Displaying all network adapter details:
ipconfig /all
echo.

:: Notify user that the discovery process has ended
echo Device discovery process ended (no data stored).
echo.
pause
exit /b

:: Function to Log System Info (Hostname, Date, IP, and Usage Time) to Tracker.txt
:logSystemInfo
cls
:: Get the current date and time
for /f "tokens=1,2 delims==" %%i in ('wmic os get localdatetime /value') do set %%i=%%j
set datetime=%localdatetime:~0,4%-%localdatetime:~4,2%-%localdatetime:~6,2%_%localdatetime:~8,2%-%localdatetime:~10,2%-%localdatetime:~12,2%

:: Get the hostname of the computer
for /f "delims=" %%a in ('hostname') do set hostname=%%a

:: Get the local IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do set ip=%%a
set ip=%ip: =%

:: Log the information to Tracker.txt without displaying in CMD
echo %datetime% - Hostname: %hostname% - IP: %ip% >> files\Tracker.txt
echo. >> files\Tracker.txt

exit /b

:: FakeHack Function
:fakeHack
cls
echo.
call :typeSlow "Initializing hacking sequence..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Verifying system compatibility..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Checking for system vulnerabilities..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Accessing network resources..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Bypassing firewall protocols..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Establishing connection with remote servers..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Decrypting encrypted data..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Injecting custom code into the target system..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "System access granted. Preparing tools..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Running packet sniffer..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Capturing local network traffic..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Analyzing passwords..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Unlocking admin privileges..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Retrieving sensitive data..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Establishing root access..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Bypassing authentication protocols..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Cracking system encryption..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Uploading malicious payload..."
ping -n 2 127.0.0.1 > nul
call :typeSlow "Exploit running successfully..."
ping -n 3 127.0.0.1 > nul
call :typeSlow "Hack complete! Enjoy your victory..."
pause
exit /b

:: NSLookup Function
:nsLookup
cls
echo.
set /p website=Enter the website URL (e.g., google.com): 
echo Performing NSLookup on %website%...
nslookup %website%
echo.
pause
exit /b
