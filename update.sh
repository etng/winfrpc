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
server_addr = xx.xx.xx.xx #你的公网机器的ip地址
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 3389
remote_port = 6000
EOT

cat<<EOT>test.vbs
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c frpc.exe -c frpc.ini",vbhide
EOT

git add .
git commit -am 'updated'
