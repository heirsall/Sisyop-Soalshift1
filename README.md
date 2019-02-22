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
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:

A. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
2012.

```
awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1
```

 Penjelasan:
awk, menjalankan perintah awk
if($7 == '2012') // mencari kata yang tahun “2012” 

iter[$1]+=$10 // {$10} artinya adalah kolom ke-10  untuk mencari penjualan(quantity) terbanyak

{for(hasil in iter) // variable “iter” tersebut dimasukan ke hasil

 {print hasil}}//cetak hasil

WA_Sales_Products_2012-14.csv // nama file csv

sort -nr // sorting hasil ke file

head -1// menampilkan output bagian pertama dari file


B. Tentukan tiga product line yang memberikan penjualan(quantity)
terbanyak pada soal poin a.
```
awk -F ',' '{if($7 == '2012' && $1 == "United States") p[$4]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'
```
awk ,untuk menjalankan perintah awk

   if($7 == '2012') // mencari data yang mengandung tahun “2012” 
       $1 == "United States // mencari negara yang sama dengan poin 2 a
       p[$4]+=$10 // {$10} artinya adalah kolom ke-10. Hasil data yang dicari disimpan dalam array yang bernama p
      for(hasil in p) //  kemudian nama variable “p” tersebut disimpan dalam hasil

WA_Sales_Products_2012-14.csv // nama file csv
sort -nr // sorting hasil ke file

awk 'NR<=3 {print $2,$3}' // menampilkan data kedua dan ketiga teratas


c. Tentukan tiga product yang memberikan penjualan(quantity)
terbanyak berdasarkan tiga product line yang didapatkan pada soal
poin 


echo "Outdoor Protection"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,3$,4$}’

mengecek apakah data sesuai dengan product line “Outdoor Protection”  dan akan menampilkan data ke-2, ke-3,dan ke-4

echo "Camping Equipment"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}’
mengecek apakah data sesuai dengan product line "Camping Equipment" dan akan menampilkan data ke-2, ke-3, dan ke-4


echo "Personal Accesories"
awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") p[$6]+=$10} END {for(hasil in c) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2$,$3,$4}’
mengecek apakah data sesuai dengan product line"Personal Accesories" dan akan menampilkan data ke-2,3,4.

## Soal 3
Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:

a. Jika tidak ditemukan file password1.txt maka password acak tersebut
disimpan pada file bernama password1.txt
b. Jika file password1.txt sudah ada maka password acak baru akan
disimpan pada file bernama password2.txt dan begitu seterusnya.
c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya
dihapus.
d. Password yang dihasilkan tidak boleh sama.


```
#!/bin/bash

a=1 // untuk looping
iter=1 // untuk menamai urutan file

while [ $a -ne 0 ] // looping hingga a adalah 0
do
//cek apakah ada file yang sama
if [[ -f /home/zahrul/praktikum1/password$iter.txt ]] ; then //cek apakah ada file dengan nama password$iter.txt,$iter berarti urutan dengan isi dari variabel iter
	iter=$((iter + 1))//jika ada maka iter ditambah satu dan cek ke file selanjutnya

else	//jika tidak ditemukan file dengan nama yang sama
 cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/zahrul/praktikum1/password$iter.txt
//buat karakter secara random dengan format a - z dan A-Z dan 0-9

a=0
//hentikan loop

fi



done
```



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
