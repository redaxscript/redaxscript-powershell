$host.ui.RawUI.WindowTitle = 'Papercut Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\papercut.zip))
{
	Invoke-WebRequest https://github.com/ChangemakerStudios/Papercut/releases/download/5.7.0/PapercutService.5.7.0.zip -Outfile C:\build\papercut.zip
}
if (!(Test-Path C:\Papercut))
{
	Expand-Archive C:\Build\papercut.zip -DestinationPath C:\Papercut -Force
}
Start-Process C:\Papercut\Papercut.Service.exe -Wait -ArgumentList 'install --sudo'
Start-Process C:\Papercut\Papercut.Service.exe -Wait -ArgumentList 'start'
