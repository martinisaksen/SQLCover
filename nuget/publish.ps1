Invoke-WebRequest -Uri https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -UseBasicParsing -OutFile ./nuget.exe
./nuget push .\GOEddie.SQLCover.0.4.1.nupkg  -ApiKey "$env:NUGET_API_KEY"  -Source https://www.nuget.org/api/v2/package