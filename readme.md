pm2 delete rosenberger-nexus || true
pm2 start ecosystem.config.js --env production
pm2 save
pm2 logs rosenberger-nexus --lines 200

pm2 flush
pm2 reloadLogs
pm2 logs rosenberger-nexus --lines 200

sudo iptables -I INPUT -p tcp --dport 3000 -j ACCEPT

sudo iptables -I INPUT -p tcp --dport 9002 -j ACCEPT