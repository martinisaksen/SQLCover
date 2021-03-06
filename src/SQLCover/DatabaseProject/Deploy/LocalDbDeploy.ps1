param(
	[string]$dacpac,
	[string]$sqlPackagePath
)


C:\"Program Files"\"Microsoft SQL Server"\120\Tools\Binn\sqllocaldb.exe info
C:\"Program Files"\"Microsoft SQL Server"\120\Tools\Binn\sqllocaldb.exe create SQLCover
C:\"Program Files"\"Microsoft SQL Server"\120\Tools\Binn\sqllocaldb.exe start SQLCover

$path = "$sqlPackagePath\Microsoft.SqlServer.Dac.dll"
Add-Type -path $path
$dacServices = new-object Microsoft.SqlServer.Dac.DacServices "server=(localdb)\SQLCover;integrated security=sspi;"
$package = [Microsoft.SqlServer.Dac.DacPackage]::Load($dacpac)

Register-ObjectEvent -InputObject $dacServices -EventName "Message" -Action { Write-Host $EventArgs.Message.Message } | out-null

$dacServices.deploy($package, "DatabaseProject", $true) 

