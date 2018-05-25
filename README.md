# Paybox Xcompile

## How to cross compile go code with simple Dockerfile and script

Update 5/61 เราได้พัฒนาการ Cross Compile บนเครื่องใดๆ ที่รัน Docker ได้

## สร้าง Docker Image ขึ้นมาใหม่

ให้เริ่มสร้าง golang image จาก [Dockerfile](Dockerfile) นี้ (จงดาวน์โหลด)
ที่มีการติดตั้ง libusb ผ่าน Dockerfile ไว้แล้วดังตัวอย่างนี้

```dockerfile
FROM golang:1.10.2
ENV GOLANG_VERSION 1.10.2
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
	libusb-dev libusb-1.0-0-dev \
	g++ \
	gcc \
	libc6-dev \
	make \
	pkg-config \
	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN mkdir -p $GOPATH/src/github.com/payboxth/vending/host

WORKDIR $GOPATH/src/github.com/payboxth/vending/host
ENTRYPOINT ["sh"]
```

ดาวน์โหลดและรัน script นี้ [gomakerbuild.sh](./script/gomakerbuild.sh)

```s
$ chmod 774 gomaker.sh
$ ./gomakerbuild.sh
```

## ใช้ Docker Image ที่มีอยู่แล้วมารัน
หรือถ้าไม่อยากสร้าง image ใหม่ ให้เรียกจาก image ที่สร้างไว้บน docker hub ก็ได้
ดาวน์โหลดและรัน script นี้ [gomaker.sh](gomaker.sh)

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

## Build กับ Raspbian
หากต้องการกำหนดให้ golang image ใหม่ มี base image แบบอื่น เช่นใช้ Raspbian ARM7 หรือแพลตฟอร์มอื่น ให้แก้ไขใน Dockerfile เช่น FROM เปลี่ยน base image ที่นี่ เช่น raspbian/stretch ดังตัวอย่าง [raspbian.Dockerfile](raspbian.Dockerfile) และแก้ไขสคริปต์รัน [raspbian-gomaker.sh](raspbian-gomaker.sh)