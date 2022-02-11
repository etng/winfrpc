https://github.com/winsw/winsw/releases/download/v2.11.0/WinSW-x86.exe
https://github.com/fatedier/frp/releases/download/v0.39.1/frp_0.39.1_windows_amd64.zip

cat <<EOT>winsw.xml
<service>
    <id>frp</id>
    <name>frp</name>
    <description>frp remote control</description>
    <executable>frpc</executable>
    <arguments>-c frpc.ini</arguments>
    <logmode>reset</logmode>
</service>
EOT

cat<<EOT>install.bat
winsw install
winsw start
EOT


cat<<EOT>frpc.ini
[common]
server_addr = 12.34.56.78
server_port = 6318
privilege_token = HUknows1
; some times it's token, misguiding field
token = HUknows1

[rdp]
type = tcp
local_ip = 127.0.0.1
local_port = 3389
remote_port = 6000

[mls]
type = tcp
local_ip = 192.168.4.155
local_port = 22
remote_port = 7155
EOT

cat<<EOT>run_hidden.vbs
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c frpc.exe -c frpc.ini",vbhide
EOT

git add .
git commit -am 'updated'

