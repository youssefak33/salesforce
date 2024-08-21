public with sharing class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String SearchWord) {
        List<List<sObject>> LeadsAndContacts = [FIND :SearchWord RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)];
        return LeadsAndContacts;
    }
}