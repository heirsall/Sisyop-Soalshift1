# LAPORAN SISOP SOAL SHIFT 1

Berisikan isi laporan soal shift.
## Soal 1
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

-Pertama yang dilakukan adalah mengunzip nature.zip

```
unzip /home/zahrul/praktikum1/nature.zip -d /home/zahrul/praktikum1/ 

```
-Lalu buat direktori baru dengan nama hasil di  /home/zahrul/praktikum1/nature

```
mkdir /home/zahrul/praktikum1/nature/hasil

```
Lalu mulai dengan kodingan
```
iter = 0 //variabel yang digunakan untuk penamaan file

for gambar in /home/zahrul/praktikum1/nature/*.jpg // Looping hingga jpg yang dimasukan di variabel gambar habis

do

base64 -d $gambar | xxd -r > /home/zahrul/praktikum1/nature/hasil/$iter.jpg
//Melakukan Decrypt dengan base 64 pada file jpg yang disimpan dalam variabel gambar
lalu dinamai dengan nama urutan file 

iter=$((iter+1)) //menambah urutan yang nantinya dijadikan untuk nama file
done



```

full code :
```

#!/bin/bash
unzip /home/zahrul/praktikum1/nature.zip -d /home/zahrul/praktikum1/
mkdir /home/zahrul/praktikum1/nature/hasil
iter = 0

for gambar in /home/zahrul/praktikum1/nature/*.jpg

do

base64 -d $gambar | xxd -r > /home/zahrul/praktikum1/nature/hasil/$iter.jpg

iter=$((iter+1))

done


```
CRONTAB
```
14 14 14 2 5 /bin/bash /home/zahrul/praktikum1/satu.sh //membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari
14 14 * 2 5 /bin/bash /home/zahrul/praktikum1/satu.sh //membuka jika jumat pada bulan februari

```
## Soal 2

## Soal 3

## Soal 4

## Soal 5
Membaca isi file system log:
 
```
 cat /var/log/syslog
```

Membuat file ```.sh```:
```
nano soal5.sh
```

Membuat program <i>AWK</i> untuk membaca file syslog yang berisikan ``` cron ``` dan tidak mengandung string ```sudo```:

```
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog
```

Dengan menabahkan number field yang diinginkan, lalu membuat alamat file log record nya:
```
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/[user]/modul1/syslogno5.log
```

Terakhir setelah membuat program <i>AWK</i>-nya, mengatur jadwal jalannya script pada Crontab setiap 6 menit dari menit ke 2 hingga 30:

```
2-30/6 * * * * /bin/bash /home/[user]/soal5.sh
```

Dengan begitu program AWK akan berjalan sesuai jadwal Crontab pada file ```soal5.sh``` lalu merecord file system log dan
membuat nya menjadi file log baru pada ```.../modul1/syslogno5.log```
