function OnSignerStartup(info) {
    console.log("===== On signer start up =====");
}

function ApproveListing() {
    console.log('===== Approve listing =====');
    return 'Approve';
}

function ApproveSignData(r) {
    console.log('===== Approve sign data =====');
    console.log(JSON.stringify(r));
    if (r.content_type == 'application/x-clique-header') {
        for (var i = 0; i < r.messages.length; i++) {
            var msg = r.messages[i];
            if (msg.name == 'Clique header' && msg.type == 'clique') {
                return 'Approve';
            }
        }
    }
    return 'Reject';
}