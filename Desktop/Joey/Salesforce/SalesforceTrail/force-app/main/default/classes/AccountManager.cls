@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // Corrected extraction of accountId
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        
        Account result =  [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                           FROM Account
                           WHERE Id = :accountId];
        return result;
    }    
}