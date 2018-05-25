#!/bin/bash
# สคริปท์นี้เรียกใช้ docker image ที่สร้างไว้ที่ docker hub ของ mrtomyum
# รันอิมเมจให้เป็น Container ขึ้นมาโดยที่ map volume ของจุดนี้ให้ตรงกับตำแหน่ง /go/src ใน container ที่ตั้งชื่อว่า maker
docker run -dt --name maker -v /Users/tom/go/src/github.com/payboxth/vending/host/:/go/src/github.com/payboxth/vending/host mrtomyum/gomaker 
# เมื่อสั่ง go build ก็จะได้ไฟล์ host วางไว้ตรงนี้เลยไม่ต้อง copy เข้าๆ ออกๆ
docker exec maker go build -ldflags "-s -w"
# สั่งหยุด container และลบทิ้งซะ
docker stop maker && docker rm maker