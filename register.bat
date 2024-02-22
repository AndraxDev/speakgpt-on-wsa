@echo off

echo Registering Native Messaging Host...

REG ADD "HKCU\Software\Google\Chrome\NativeMessagingHosts\org.teslasoft.assistant" /ve /t REG_SZ /d "%~dp0\Manifest.json" /f
REG ADD "HKEY_CLASSES_ROOT\sp" /ve /t REG_SZ /d "URL:speakgpt" /f
REG ADD "HKEY_CLASSES_ROOT\sp\shell\open\command" /ve /t REG_SZ /d "C:\Users\conta\AppData\Local\Microsoft\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\WsaClient.exe /launch wsa://org.teslasoft.assistant" /f

echo Done!
