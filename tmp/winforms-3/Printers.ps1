#---------------------------------------------------------[Initialisations]--------------------------------------------------------
# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


#---------------------------------------------------------[Form]--------------------------------------------------------

[System.Windows.Forms.Application]::EnableVisualStyles()

$LocalPrinterForm                    = New-Object system.Windows.Forms.Form
$LocalPrinterForm.ClientSize         = '480,300'
$LocalPrinterForm.text               = "Printers"
$LocalPrinterForm.BackColor          = "#ffffff"
$LocalPrinterForm.TopMost            = $false
$Icon                                = New-Object system.drawing.icon ("//thunnissen.local/netlogon/printer.ico")
$LocalPrinterForm.Icon               = $Icon

$Titel                           = New-Object system.Windows.Forms.Label
$Titel.text                      = "Add new printer"
$Titel.AutoSize                  = $true
$Titel.width                     = 25
$Titel.height                    = 10
$Titel.location                  = New-Object System.Drawing.Point(20,20)
$Titel.Font                      = 'Microsoft Sans Serif,13'

$Description                     = New-Object system.Windows.Forms.Label
$Description.text                = "To add a printer, make sure you are connected to the same network as the printer.."
$Description.AutoSize            = $false
$Description.width               = 450
$Description.height              = 50
$Description.location            = New-Object System.Drawing.Point(20,50)
$Description.Font                = 'Microsoft Sans Serif,10'

$PrinterStatus                   = New-Object system.Windows.Forms.Label
$PrinterStatus.text              = "Status:"
$PrinterStatus.AutoSize          = $true
$PrinterStatus.width             = 25
$PrinterStatus.height            = 10
$PrinterStatus.location          = New-Object System.Drawing.Point(20,115)
$PrinterStatus.Font              = 'Microsoft Sans Serif,10,style=Bold'

$PrinterFound                    = New-Object system.Windows.Forms.Label
$PrinterFound.text               = "Searching for printer..."
$PrinterFound.AutoSize           = $true
$PrinterFound.width              = 25
$PrinterFound.height             = 10
$PrinterFound.location           = New-Object System.Drawing.Point(100,115)
$PrinterFound.Font               = 'Microsoft Sans Serif,10'

$PrinterDetails                  = New-Object system.Windows.Forms.Label
$PrinterDetails.text             = "Printer details"
$PrinterDetails.AutoSize         = $true
$PrinterDetails.width            = 25
$PrinterDetails.height           = 10
$PrinterDetails.location         = New-Object System.Drawing.Point(20,150)
$PrinterDetails.Font             = 'Microsoft Sans Serif,12'
$PrinterDetails.Visible          = $false

$PrinterNameLabel                = New-Object system.Windows.Forms.Label
$PrinterNameLabel.text           = "Name:"
$PrinterNameLabel.AutoSize       = $true
$PrinterNameLabel.width          = 25
$PrinterNameLabel.height         = 20
$PrinterNameLabel.location       = New-Object System.Drawing.Point(20,180)
$PrinterNameLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$PrinterNameLabel.Visible        = $false

$PrinterName                     = New-Object system.Windows.Forms.TextBox
$PrinterName.multiline           = $false
$PrinterName.width               = 314
$PrinterName.height              = 20
$PrinterName.location            = New-Object System.Drawing.Point(100,180)
$PrinterName.Font                = 'Microsoft Sans Serif,10'
$PrinterName.Visible             = $false

$PrinterTypeLabel                = New-Object system.Windows.Forms.Label
$PrinterTypeLabel.text           = "Brand:"
$PrinterTypeLabel.AutoSize       = $true
$PrinterTypeLabel.width          = 25
$PrinterTypeLabel.height         = 20
$PrinterTypeLabel.location       = New-Object System.Drawing.Point(20,210)
$PrinterTypeLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$PrinterTypeLabel.Visible        = $false

$PrinterType                     = New-Object system.Windows.Forms.ComboBox
$PrinterType.text                = ""
$PrinterType.width               = 170
$PrinterType.height              = 20
@('Canon','Hp') | ForEach-Object {[void] $PrinterType.Items.Add($_)}
$PrinterType.SelectedIndex       = 0
$PrinterType.location            = New-Object System.Drawing.Point(100,210)
$PrinterType.Font                = 'Microsoft Sans Serif,10'
$PrinterType.Visible             = $false

$AddPrinterBtn                   = New-Object system.Windows.Forms.Button
$AddPrinterBtn.BackColor         = "#ff7b00"
$AddPrinterBtn.text              = "Add"
$AddPrinterBtn.width             = 90
$AddPrinterBtn.height            = 30
$AddPrinterBtn.location          = New-Object System.Drawing.Point(370,250)
$AddPrinterBtn.Font              = 'Microsoft Sans Serif,10'
$AddPrinterBtn.ForeColor         = "#ffffff"
$AddPrinterBtn.Visible           = $false

$cancelBtn                       = New-Object system.Windows.Forms.Button
$cancelBtn.BackColor             = "#ffffff"
$cancelBtn.text                  = "Cancel"
$cancelBtn.width                 = 90
$cancelBtn.height                = 30
$cancelBtn.location              = New-Object System.Drawing.Point(260,250)
$cancelBtn.Font                  = 'Microsoft Sans Serif,10'
$cancelBtn.ForeColor             = "#000"
$cancelBtn.DialogResult          = [System.Windows.Forms.DialogResult]::Cancel
$LocalPrinterForm.CancelButton   = $cancelBtn
$LocalPrinterForm.Controls.Add($cancelBtn)

$LocalPrinterForm.controls.AddRange(@($Titel,$Description,$PrinterStatus,$PrinterFound,$PrinterName,$PrinterNameLabel,$PrinterType,$AddPrinterBtn,$cancelBtn,$PrinterTypeLabel,$PrinterDetails))

#-----------------------------------------------------------[Functions]------------------------------------------------------------

function AddPrinter { 
  $PrinterFound.ForeColor = "#000000"
  $PrinterFound.Text = 'Adding printer...'
  # Check printer port
  $portName = "TCPPort:"+$printerIp
  $portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

  # Create port if it not exists
  if (-not $portExists) {
    $PrinterFound.Text = 'Creating printer port...'
    Add-PrinterPort -name $portName -PrinterHostAddress $printerIp
  }

  # Select the correct driver
  if ($PrinterType.SelectedItem -eq 'Canon') {
    $printerDriverName = "Canon Generic Plus PCL6"
  }else{
    $printerDriverName = "HP LaserJet M227-M231 PCL-6"
  }

  # Check if printer driver exists
  $printDriverExists = Get-PrinterDriver -name $printerDriverName -ErrorAction SilentlyContinue

  # Install printer or printer driver and printer
  if ($printDriverExists) {
    $PrinterFound.Text = 'Installing printer...'
    Add-Printer -Name $printerName.text -PortName $portName -DriverName $printerDriverName 
  }else{
    $PrinterFound.Text = 'Installing printer driver...'
    Add-PrinterDriver -name $printerDriverName

    $PrinterFound.Text = 'Installing printer...'
    Add-Printer -Name $printerName.text -PortName $portName -DriverName $printerDriverName
  }

  if (Get-Printer -Name $printerName.text) {
    $PrinterFound.ForeColor = "#7ed321"
    $PrinterFound.Text = 'The printer is installed'
  }
  else {
    $PrinterFound.ForeColor = "#D0021B"
    $PrinterFound.Text = 'Installation failed'
  }
  $PrinterNameLabel.Visible = $false
  $PrinterName.Visible = $false
  $PrinterType.Visible = $false
  $AddPrinterBtn.Visible = $false
  $PrinterDetails.Visible = $false
  $PrinterTypeLabel.Visible = $false
  $cancelBtn.text = "Close"
}

#---------------------------------------------------------[Script]--------------------------------------------------------
# Get printers IP Address
$clientIP = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress

$networkAddress = $clientIP.Split('.')
$networkAddress = $networkAddress[0]+"."+$networkAddress[1]+"."+$networkAddress[2]

# Check if printer is online
$printerIp =  $networkAddress + ".31" 
$testConnection = Test-Connection $printerIp -count 1 -Quiet

If ($testConnection) {
  $PrinterFound.text = "Printer found"
  $PrinterFound.ForeColor = "#7ed321"
  $PrinterNameLabel.Visible = $true
  $PrinterName.Visible = $true
  $PrinterType.Visible = $true
  $AddPrinterBtn.Visible = $true
  $PrinterDetails.Visible = $true
  $PrinterTypeLabel.Visible = $true
}else{
  $PrinterFound.text = "No printers found"
  $PrinterFound.ForeColor = "#D0021B"
  $cancelBtn.text = "Cancel"
}

$AddPrinterBtn.Add_Click({ AddPrinter })

[void]$LocalPrinterForm.ShowDialog()