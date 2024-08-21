public with sharing class ContactSearch {
    public static Contact[] SearchForContacts(String Name, String Postal) {
        Contact[] cons = [SELECT LastName, MailingPostalCode FROM Contact WHERE LastName=:Name AND MailingPostalCode=:Postal];
        return cons;
    }
}