public with sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact inputContact, String inputState) {
        this.contact = inputContact;
        this.state = inputState;
    }

    public void execute(QueueableContext context) {

        Account[] accounts = [SELECT Id FROM Account WHERE BillingState =:state LIMIT 200];

        Contact[] contacts = new List<Contact>();

        for (Account acct : accounts) {
            Contact contactClone = contact.clone();
            contactClone.accountId = acct.Id;
            contacts.add(contactClone);
        }

        insert contacts;
    }
}