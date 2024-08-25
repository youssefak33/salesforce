@isTest
private class AddPrimaryContactTest {
    
    @isTest
    private static void AddPrimaryContactTest() {

        Account[] accounts = new List<Account>();
        for (Integer i=0; i<500; i++) {
            Account acct = new Account(Name='Test Account');
            if (i < 250) {
                acct.BillingState = 'NY';
            }
            else {
                acct.BillingState = 'CA';
            }
            accounts.add(acct);            
        }
        insert accounts;

        Contact contact = new Contact (FirstName = 'Simon', LastName='Connock');
        insert contact; 

        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        Contact[] contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(), 'Error incorrect');

    }
}