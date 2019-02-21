# LAPORAN SISOP SOAL SHIFT 1

Berisikan isi laporan soal shift.
## Soal 1

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
