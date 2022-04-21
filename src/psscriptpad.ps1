$Label1_Click = {
}
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
. (Join-Path $PSScriptRoot 'psscriptpad.designer.ps1')
$Form1.ShowDialog()