Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName 'PresentationFramework'
[System.Windows.Forms.Application]::EnableVisualStyles()

# Dummy WPF window (prevents auto scaling).
[xml]$Xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window">
</Window>
"@
$Reader = (New-Object System.Xml.XmlNodeReader $Xaml)
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# Rest des Codes
$Form = New-Object System.Windows.Forms.Form