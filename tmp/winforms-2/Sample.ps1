Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# enable rich visual styles in PowerShell console mode:
[System.Windows.Forms.Application]::EnableVisualStyles()

$form1 = New-Object System.Windows.Forms.Form
$button2 = New-Object System.Windows.Forms.Button
$button1 = New-Object System.Windows.Forms.Button

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 256
$System_Drawing_Size.Height = 44
$form1.ClientSize = $System_Drawing_Size
$form1.FormBorderStyle = 3
$form1.TopMost = $True
$form1.Text = "Your Choice"
$form1.ControlBox = $False
$form1.StartPosition = 1

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$button2.Size = $System_Drawing_Size
$button2.UseVisualStyleBackColor = $True
$button2.Text = "Don''t do it"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 174
$System_Drawing_Point.Y = 12
$button2.Location = $System_Drawing_Point
$button2.DialogResult = 2

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$button1.Size = $System_Drawing_Size
$button1.UseVisualStyleBackColor = $True
$button1.Text = "Do it"

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 92
$System_Drawing_Point.Y = 12
$button1.Location = $System_Drawing_Point
$button1.DataBindings.DefaultDataSourceUpdateMode = 0
$button1.DialogResult = 1

$form1.Controls.Add($button2)
$form1.Controls.Add($button1)

$form1.ShowDialog()