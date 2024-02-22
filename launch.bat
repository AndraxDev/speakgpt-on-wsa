@echo off

echo Run location: %~dp0

echo Starting WSA Service...

WsaClient /launch wsa://system

echo Starting adb server...
%~dp0\adb\adb.exe connect localhost:58526

echo Launching SpeakGPT...

if %2==1 (
	%~dp0\adb\adb.exe shell am start -n org.teslasoft.assistant/org.teslasoft.assistant.ui.assistant.WindowsProxy -e prompt '%1' -e runWithParams "true"
) else (
	%~dp0\adb\adb.exe shell am start -n org.teslasoft.assistant/org.teslasoft.assistant.ui.assistant.WindowsProxy -e prompt '%1' -e runWithParams "false"
)
