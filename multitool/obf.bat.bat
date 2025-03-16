@echo off
if "%~1" == "" exit /b
if /i "%~x1" neq ".bat" if /i "%~x1" neq ".cmd" exit /b

:: Check if certutil.exe exists in the system path
where certutil.exe >nul 2>nul
if errorlevel 1 (
    echo certutil.exe not found.
    pause
    exit /b
)

:: Create temporary encoded file
echo //4nY2xzDQo > temp.~b64

:: Decode the base64 content and output to a new file
certutil.exe -f -decode temp.~b64 "%~n1__%~x1"

:: Delete the temporary file
del temp.~b64

:: Concatenate the decoded content to the original file
copy /b "%~n1__%~x1" + "%~1" "%~n1_decoded%~x1"
