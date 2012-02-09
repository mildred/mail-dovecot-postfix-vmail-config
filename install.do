ln -s "$(pwd)/postfix/main.cf" /etc/postfix/main.cf
ln -s "$(pwd)/dovecot" /etc/dovecot
echo "Update /etc/aliases then run newaliases"
