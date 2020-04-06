
function updateFromAccountInfo(account, accountInfo) {
    account.username = accountInfo[process.env.ACCOUNT_SERVICE_LOGIN_FIELD];
    account.email = "example@portal.eu";
    account.uid = 1;
    account.gid = 1;
    account.homePath = "/home/panosc";
    account.userId = hashInt(accountInfo[process.env.ACCOUNT_SERVICE_LOGIN_FIELD]);
}
exports.updateFromAccountInfo = updateFromAccountInfo;
function update(account) {
    // To be implemented if updateFromAccountInfo is not sufficient for feeding user
}
exports.update = update;

function hashInt (str, max = 1000) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
        hash = ((hash << 5) - hash) + str.charCodeAt(i);
        hash = hash & hash;
    }
    return Math.round(max * Math.abs(hash) / 2147483648);
}