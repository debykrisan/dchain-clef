CHAIN_ID=17845
KEYSTORE=clef/keystore
CONFIGDIR=clef
PASSWORD=<PASSWORD>
WALLET_ADDRESS=<WALLET_ADDRESS>

echo "==========inisiasi clef=========="
expect << EOF
spawn clef --keystore $KEYSTORE --configdir $CONFIGDIR --chainid $CHAIN_ID --suppress-bootwarn init
expect "Password:"
send "$PASSWORD\n"
expect "Repeat password:"
send "$PASSWORD\n"
expect eof
EOF

echo "==========storing password of wallet in clef=========="
expect << EOF
spawn clef --keystore $KEYSTORE --configdir $CONFIGDIR --chainid $CHAIN_ID --suppress-bootwarn setpw $WALLET_ADDRESS
expect "Password:"
send "$PASSWORD\n"
expect "Repeat password:"
send "$PASSWORD\n"
expect "Password:"
send "$PASSWORD\n"
expect eof
EOF