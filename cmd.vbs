strProgram = "cmd.exe" 
strPath    = "C:\windows\system32"

Set fso = CreateObject("Scripting.FileSystemObject")
strCommand = fso.BuildPath(strPath, strProgram)

Set app = CreateObject("Shell.Application")
app.ShellExecute strCommand, , strPath, , 1
