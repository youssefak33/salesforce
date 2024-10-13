@isTest 
private class AccountManagerTest {
    @isTest static void testGetAccountsById() {
        Id accountId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' +accountId+ '/contacts'; 
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        System.Assert.isTrue(thisAccount != null);
        System.Assert.areEqual('Test record', thisAccount.Name);
        System.Assert.areEqual(1,thisAccount.Contacts.size());
        
    }
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(
            Name='Test record');
        insert accountTest;
        Contact contactTest = new Contact(
            LastName='Test record',
            AccountId=accountTest.Id);
        insert contactTest;
        return accountTest.Id;
    }
}