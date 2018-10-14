$host.ui.RawUI.WindowTitle = 'PHP Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\PHP', 'User')

New-Item build -ItemType Directory -Force
Invoke-WebRequest -Uri https://windows.php.net/downloads/releases/php-7.2.11-nts-Win32-VC15-x64.zip -OutFile build\php.zip
Expand-Archive build\php.zip -DestinationPath C:\PHP -Force
Copy-Item php.ini -Destination C:\PHP\php.ini

