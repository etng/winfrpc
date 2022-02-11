# winfrpc
frp client for windows AIO

* install frp client as windows service or run standalone with hidden console
* edit `frpc.ini` to forward ports as usual

 ## usage

* run `install.bat` with super admin privilege
* or run `run_hidden.vbs` and check frpc process in task manager
* try connect the server with client like this:
```shell
ssh-copy-id -p7155 me@12.34.56.78
ssh  -p7155 me@12.34.56.78
```
