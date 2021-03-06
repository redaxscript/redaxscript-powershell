If ((Get-CimInStance CIM_OperatingSystem).OSArchitecture -eq '64-bit')
{
	$title = 'PostgreSQL Setup (64-Bit)'
	$url = 'https://get.enterprisedb.com/postgresql/postgresql-12.1-3-windows-x64.exe'
}
Else
{
	$title = 'PostgreSQL Setup (32-Bit)'
	$url = 'https://get.enterprisedb.com/postgresql/postgresql-10.11-3-windows.exe'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\postgresql-setup.exe))
{
	Invoke-WebRequest $url -OutFile C:\Build\postgresql-setup.exe
}
Start-Process C:\Build\postgresql-setup.exe -Wait -ArgumentList '--mode unattended'
