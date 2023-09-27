sudo apt update && sudo apt install qemu qemu-system-x86 aria2 -y
aria2c -x16 -s16 -oDVD.iso https://software.download.prss.microsoft.com/dbazure/Win10_22H2_English_x64v1.iso?t=2e72dcc9-db42-47c8-9fdd-6b181e5ec0a3&e=1695874508&h=12a9aa41b73d91946fad95ff5b55e76925032939a760fa3c049ed29085488f5e
qemu-img create -f qcow2 disk.img 128G
git clone https://github.com/novnc/noVNC.git noVNC
qemu-system-x86_64 -m 10240 -hda disk.img -vnc 127.0.0.1:1 -boot c -usbdevice tablet -cdrom DVD.iso -netdev user,id=n1 -device e1000,netdev=n1 -enable-kvm & ./noVNC/utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:80
