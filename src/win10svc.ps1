. ($PSScriptRoot + '\win10svc_support.ps1')

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$TLabel1 = New-Object System.Windows.Forms.Label
$TLabel1.Location = "12,9"
$TLabel1.Size = "100,25"
$TLabel1.Text = "Service:"

$TLabel2 = New-Object System.Windows.Forms.Label
$TLabel2.Location = "118,9"
$TLabel2.Size = "100,25"
$TLabel2.Text = "-"

$TLabel3 = New-Object System.Windows.Forms.Label
$TLabel3.Location = "12,32"
$TLabel3.Size = "100,25"
$TLabel3.Text = "Status:"

$TLabel4 = New-Object System.Windows.Forms.Label
$TLabel4.Location = "118,32"
$TLabel4.Size = "100,25"
$TLabel4.Text = "-"

$TLabel5 = New-Object System.Windows.Forms.Label
$TLabel5.Location = "12,55"
$TLabel5.Size = "100,25"
$TLabel5.Text = "Success:"

$TLabel6 = New-Object System.Windows.Forms.Label
$TLabel6.Location = "118,55"
$TLabel6.Size = "100,25"
$TLabel6.Text = "0"

$TLabel7 = New-Object System.Windows.Forms.Label
$TLabel7.Location = "12,78"
$TLabel7.Size = "100,25"
$TLabel7.Text = "Failure:"

$TLabel8 = New-Object System.Windows.Forms.Label
$TLabel8.Location = "118,78"
$TLabel8.Size = "100,25"
$TLabel8.Text = "0"

$TProgressbar1 = New-Object System.Windows.Forms.ProgressBar
$TProgressbar1.Location = "12,121"
$TProgressbar1.Size = "258,25"

$TButton1 = New-Object System.Windows.Forms.Button
$TButton1.Location = "12,168"
$TButton1.Size = "75,25"
$TButton1.Text = "&About"
$TButton1.TabIndex = 2
$TButton1.Add_Click({
	. Show-About-Dialog
})

$TButton2 = New-Object System.Windows.Forms.Button
$TButton2.Location = "102,168"
$TButton2.Size = "75,25"
$TButton2.Text = "&Log"
$TButton2.TabIndex = 1
$TButton2.Enabled = $false

$TButton3 = New-Object System.Windows.Forms.Button
$TButton3.Location = "195,168"
$TButton3.Size = "75,25"
$TButton3.Text = "&Repair"
$TButton3.TabIndex = 0

$top = New-Object System.Windows.Forms.Form

$top.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$top.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$top.ClientSize = "282,203"
$top.Text = "Windows 10 Service Repair"
$top.MaximizeBox = $false

$top.Controls.Add($TLabel1)
$top.Controls.Add($TLabel2)
$top.Controls.Add($TLabel3)
$top.Controls.Add($TLabel4)
$top.Controls.Add($TLabel5)
$top.Controls.Add($TLabel6)
$top.Controls.Add($TLabel7)
$top.Controls.Add($TLabel8)
$top.Controls.Add($TProgressbar1)
$top.Controls.Add($TButton1)
$top.Controls.Add($TButton2)
$top.Controls.Add($TButton3)

$top.ShowDialog()
