var hashInt = require("hash-int");

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