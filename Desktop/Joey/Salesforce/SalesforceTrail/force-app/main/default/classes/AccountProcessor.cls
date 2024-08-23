public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> Accts) {
        Account[] Acc = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :Accts];
        for (Account Ac : Acc) {
            Ac.Number_Of_Contacts__c = Ac.Contacts.size();
        }
        update Acc;
    }
}