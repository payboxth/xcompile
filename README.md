# xcompile
Cross compile go code with simple Dockerfile and script



Update 5/61 เราได้พัฒนาการ Cross Compile บนเครื่องใดๆ ที่รัน Docker ได้
โดยได้สร้าง golang image จาก [Dockerfile](./script/Dockerfile) นี้ (จงดาวน์โหลด)
ที่มีการติดตั้ง libusb ผ่าน Dockerfile ไว้แล้ว

ดาวน์โหลดและรัน script นี้ [gomakerbuild.sh](./script/gomakerbuild.sh)

```s
$ chmod 774 gomaker.sh
$ ./gomakerbuild.sh
```

หรือถ้าไม่อยากสร้าง image ใหม่ ให้เรียกจาก image ที่สร้างไว้บน docker hub ก็ได้
ดาวน์โหลดและรัน script นี้ [gomaker.sh](./script/gomaker.sh)

```s
$ docker pull mrtomyum/gomaker
$ ./gomaker.sh
```


จะได้ไฟล์  host ที่ใช้รันบนตู้ออกมา

### SCP

```s
- $ scp -r /host/host paybox@192.168.100.100:/app
```

## UI (Vue.JS)

### SCP

```s
- $ scp -r /ui/build/* paybox@192.168.100.100:/app
```