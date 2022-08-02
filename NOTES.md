# Notes

- dialogs split into separate scripts
- merged into one script
- compiled to exe via "Win-PS2EXE"

## User Stories:

When the user starts the script:
	checks if "services.zip" is present
		if "services.zip" does not exist, download "services.zip"
			if download fails, show a file selection dialog

When the user clicks the "Repair"-button:
	run the script

When the user clicks the "Pause"-button:
	pause the script

When the user clicks the "About"-button:
	show the about dialog
