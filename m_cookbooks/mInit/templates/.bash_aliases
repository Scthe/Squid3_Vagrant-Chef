alias acclog='sudo tail -f /var/log/squid3/access.log'
alias cachelist='sudo ls /var/spool/squid3/ -l'

clrcache() {
  sudo service squid3 stop
  sudo rm -rf /var/spool/squid3/*
  squid3 -z
  #squid3 -k shutdown
  start squid3
}

clrlog() {
  sudo rm -f /var/log/squid3/*.log
  sudo service squid3 reload
}
