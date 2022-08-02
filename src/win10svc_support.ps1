function Show-About-Dialog() {
	. ($PSScriptRoot + '\dialogs\about_dialog.ps1')
}

function Show-Log-File() {
	Write-Host 'Debug: Show-Log-File()'
}

<#
def update_progress_bar():
	# extract reg files
    path = os.getenv("TEMP") + "/win10svc"

    zip = zipfile.ZipFile("services.zip")
    zip.extractall(path)
    
	# get list of reg files
    reg_files = os.listdir(path)
	
	# count reg files
    no_files = len(reg_files)

    reg_files_error = []
    success = 0
    failure = 0

    for file_no, reg_file in enumerate(reg_files):
        percent = (100*(file_no+1)) # no_files

        service = re.subn("_", " ", reg_file)[0]
        service = re.subn("\.reg$", "", service)[0]

        w.TLabel2["text"] = service

		# cal reg to import reg file
        r_value = subprocess.call(["reg", "import", "%s/%s" % (path, reg_file)]) # reg import yourfile.reg

        if r_value == 0:
            w.TLabel4["text"] = "Success"

            success += 1
        else:
            w.TLabel4["text"] = "Failure"

            failure += 1
            
            reg_files_error.append(reg_file)
        
        w.TLabel6["text"] = success
        w.TLabel8["text"] = failure

        print("%s%% %s %s" % (percent, service, r_value))
        
        w.TProgressbar1["value"] = percent
#>
function Update-Progress-Bar() {
	# Expand-Archive -LiteralPath C:\Archives\Invoices.Zip -DestinationPath C:\ InvoicesUnzipped

	Write-Host 'Debug: Update-Progress-Bar()'
}

function Repair-Windows-Services() {
	Write-Host 'Debug: Repair-Windows-Services()'
}

function Init() {
	Write-Host 'Debug: Init()'
}

function Destroy-Window() {
	Write-Host 'Debug: Destroy-Window()'
}