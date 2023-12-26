#!/bin/sh
CHAIN_ID=17845
KEYSTORE=root/.clef/keystore
CONFIGDIR=root/.clef
PASSWORD=1234567890
GETH=*

#init rules
expect << EOF
spawn clef --keystore $KEYSTORE --configdir $CONFIGDIR --chainid $CHAIN_ID --suppress-bootwarn  attest  `sha256sum $CONFIGDIR/rules.js | cut -f1`
expect "Password:"
send "$PASSWORD\n"
expect eof
EOF

# running clef
expect << EOF
set timeout -1
spawn clef --keystore $KEYSTORE --configdir $CONFIGDIR --chainid $CHAIN_ID  --suppress-bootwarn  --rules $CONFIGDIR/rules.js --http --nousb --http.vhosts $GETH --http.addr 0.0.0.0
expect ">"
send "$PASSWORD\n"
expect eof
EOF