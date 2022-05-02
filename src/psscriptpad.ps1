function InitializeComponent
{
	$TLabel1 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel2 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel3 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel4 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel5 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel6 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel7 = (New-Object -TypeName System.Windows.Forms.Label)
	$TLabel8 = (New-Object -TypeName System.Windows.Forms.Label)
	$TProgressbar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
	$TButton1 = (New-Object -TypeName System.Windows.Forms.Button)
	$TButton2 = (New-Object -TypeName System.Windows.Forms.Button)
	$TButton3 = (New-Object -TypeName System.Windows.Forms.Button)

	$TLabel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
	$TLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel1.TabIndex = [System.Int32]0
	$TLabel1.Text = [System.String]'Service:'

	$TLabel2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]118,[System.Int32]9))
	$TLabel2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel2.TabIndex = [System.Int32]1
	$TLabel2.Text = [System.String]'-'

	$TLabel3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]32))
	$TLabel3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel3.TabIndex = [System.Int32]2
	$TLabel3.Text = [System.String]'Status:'

	$TLabel4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]118,[System.Int32]32))
	$TLabel4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel4.TabIndex = [System.Int32]3
	$TLabel4.Text = [System.String]'-'

	$TLabel5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]55))
	$TLabel5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel5.TabIndex = [System.Int32]4
	$TLabel5.Text = [System.String]'Success:'

	$TLabel6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]118,[System.Int32]55))
	$TLabel6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel6.TabIndex = [System.Int32]5
	$TLabel6.Text = [System.String]'0'

	$TLabel7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]78))
	$TLabel7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel7.TabIndex = [System.Int32]6
	$TLabel7.Text = [System.String]'Failure:'

	$TLabel8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]118,[System.Int32]78))
	$TLabel8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
	$TLabel8.TabIndex = [System.Int32]7
	$TLabel8.Text = [System.String]'0'

	$TProgressbar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]121))
	$TProgressbar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]258,[System.Int32]23))
	$TProgressbar1.TabIndex = [System.Int32]8

	$TButton1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]168))
	$TButton1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
	$TButton1.TabIndex = [System.Int32]9
	$TButton1.Text = [System.String]'About'
	$TButton1.UseVisualStyleBackColor = $true

	$TButton2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]102,[System.Int32]168))
	$TButton2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
	$TButton2.TabIndex = [System.Int32]10
	$TButton2.Text = [System.String]'Log'
	$TButton2.UseVisualStyleBackColor = $true

	$TButton3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]195,[System.Int32]168))
	$TButton3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
	$TButton3.TabIndex = [System.Int32]11
	$TButton3.Text = [System.String]'Repair'
	$TButton3.UseVisualStyleBackColor = $true

	$top.Controls.Add($TButton3)
	$top.Controls.Add($TButton2)
	$top.Controls.Add($TButton1)
	$top.Controls.Add($TProgressbar1)
	$top.Controls.Add($TLabel8)
	$top.Controls.Add($TLabel7)
	$top.Controls.Add($TLabel6)
	$top.Controls.Add($TLabel5)
	$top.Controls.Add($TLabel4)
	$top.Controls.Add($TLabel3)
	$top.Controls.Add($TLabel2)
	$top.Controls.Add($TLabel1)

	$top.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]282,[System.Int32]203))
	$top.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
	$top.MaximizeBox = $false
	$top.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
	$top.Text = [System.String]'Windows 10 Service Repair'
	$top.ResumeLayout($false)
}

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$top = New-Object System.Windows.Forms.Form

InitializeComponent

$top.ShowDialog()