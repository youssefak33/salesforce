public with sharing class AccountHandler {
    public static Account insertNewAccount(String Nothing) {
        Account acct = new Account(Name=Nothing);
        Database.SaveResult ac = Database.insert(acct, false);
        if (ac.isSuccess()) {
            return acct;
        }
        else {
            return null;
        }
    }
}