$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Start-Process C:\Papercut\Papercut.Service.exe -ArgumentList 'start'
Start-Process grunt -ArgumentList 'serve -O' -WorkingDirectory redaxscript