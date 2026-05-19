Get-PSDrive -PSProvider FileSystem | ForEach-Object {
	Write-Host "Checking drive: $($_.Name):" 

	# -WhatIf
	if ($_.Name -eq "C") {
		Write-Host "$env:HOMEDRIVE$env:HOMEPATH\"
		Get-ChildItem -Path "$env:HOMEDRIVE$env:HOMEPATH\" -Filter *.ffs_tmp -Recurse | Remove-Item -Force SilentlyContinue
		Get-ChildItem -Path "$env:HOMEDRIVE$env:HOMEPATH\" -Filter "RecycleBin*.ffs_tmp" -Directory -Recurse | Remove-Item -Recurse -Force
	} else {		
		Get-ChildItem -Path "$($_.Name):\" -Filter *.ffs_tmp -Recurse | Remove-Item -Force SilentlyContinue
		Get-ChildItem -Path "$($_.Name):\" -Filter "*.ffs_tmp" -Directory -Recurse | Remove-Item -Recurse -Force 
		Get-ChildItem -Path "$($_.Name):\" -Filter "*.ffs_db" -Directory -Recurse | Remove-Item -Recurse -Force 
	}
}
