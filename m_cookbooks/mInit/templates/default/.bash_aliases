alias acclog='tail -f /var/log/squid3/access.log'
alias cachelist='ls /var/spool/squid3/ -l'

clrcache() {
  service squid3 stop
  rm -rf /var/spool/squid3/*
  squid3 -z
  #squid3 -k shutdown
  start squid3
}

clrlog() {
  rm -f /var/log/squid3/*.log
  service squid3 reload
}
