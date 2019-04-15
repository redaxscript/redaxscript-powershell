If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'Node Setup (64-Bit)'
	$url = 'https://nodejs.org/dist/v11.9.0/node-v11.9.0-x64.msi'
}
Else
{
	$title = 'Node Setup (32-Bit)'
	$url = 'https://nodejs.org/dist/v11.9.0/node-v11.9.0-x86.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item build -ItemType Directory -Force
Invoke-WebRequest $url -OutFile build\node-setup.msi
Start-Process msiexec -ArgumentList '/i build\node-setup.msi /passive' -Wait
