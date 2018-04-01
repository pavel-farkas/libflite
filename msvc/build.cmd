set solution=flite.2015.sln
set MSBuildToolsPath="C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild"
echo %MSBuildToolsPath%
cmd /C %MSBuildToolsPath% %solution% /p:Configuration=Debug /p:Platform=Win32 /t:Build /p:PlatformToolset=v140
cmd /C %MSBuildToolsPath% %solution% /p:Configuration=Debug /p:Platform=x64 /t:Build /p:PlatformToolset=v140
cmd /C %MSBuildToolsPath% %solution% /p:Configuration=Release /p:Platform=Win32 /t:Build /p:PlatformToolset=v140
cmd /C %MSBuildToolsPath% %solution% /p:Configuration=Release /p:Platform=x64 /t:Build /p:PlatformToolset=v140
