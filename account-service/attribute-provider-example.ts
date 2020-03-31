function updateFromAccountInfo(account, accountInfo) {
    account.username = accountInfo['preferred_username'];
    account.email = accountInfo['email'];
    account.uid = accountInfo['uid'];
    account.gid = accountInfo['gid'];
    account.homePath = accountInfo['homeDirectory'];
    account.userId = accountInfo['employeeNumber'];
}
exports.updateFromAccountInfo = updateFromAccountInfo;
function update(account) {
    // To be implemented if updateFromAccountInfo is not sufficient for feeding user
}