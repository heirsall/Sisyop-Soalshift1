awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/tieria21/modul1/syslogno5.log
