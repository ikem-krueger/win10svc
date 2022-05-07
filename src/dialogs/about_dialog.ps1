Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Label1 = New-Object System.Windows.Forms.Label
$Label1.Font = New-Object System.Drawing.Font("Tahoma",14.25,[System.Drawing.FontStyle]::Bold)
$Label1.Location = "71,19"
$Label1.Size = "144,25"
$Label1.Text = "win10svc 1.0"

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Location = "25,52"
$Label2.Size = "233,25"
$Label2.Text = "A small tool to reset the Windows 10 services"

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Location = "71,71"
$Label3.Size = "144,25"
$Label3.Text = "back to their default states."

$Label4 = New-Object System.Windows.Forms.Label
$Label4.Location = "59,110"
$Label4.Size = "171,22"
$Label4.Text = "Copyright (C) 2017 Ikem Krueger"

$LinkLabel1 = New-Object System.Windows.Forms.LinkLabel
$LinkLabel1.Font = New-Object System.Drawing.Font("Tahoma",9,[System.Drawing.FontStyle]::Regular)
$LinkLabel1.Location = "12,133"
$LinkLabel1.Size = "246,25"
$LinkLabel1.Text = "https://github.com/ikem-krueger/win10svc"

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = "191,160"
$Button1.Size = "82,25"
$Button1.Text = "&Close"
$Button1.TabIndex = 0

$Button1.Add_Click({
	$Form1.Close()
})

$Form1 = New-Object -TypeName System.Windows.Forms.Form

$Form1.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$Form1.ClientSize = "284,193"
$Form1.Text = "About - Windows 10 Service Tool"
$Form1.MaximizeBox = $false
$Form1.KeyPreview = $true
$Form1.Add_KeyDown({
	if($_.KeyCode -eq "Escape") {
		$Form1.Close()
	}
})

$Form1.Controls.Add($Button1)
$Form1.Controls.Add($LinkLabel1)
$Form1.Controls.Add($Label4)
$Form1.Controls.Add($Label3)
$Form1.Controls.Add($Label2)
$Form1.Controls.Add($Label1)

$Form1.ShowDialog()
