public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        for (Account acct : accts) {
            if (acct.ShippingState != acct.BillingState) {
                acct.ShippingState = acct.BillingState;            }
        }
    }
}