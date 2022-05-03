$Label1_Click = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'about_dialog.designer.ps1')
$Form1.ShowDialog()