public without sharing class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator ('SELECT Id, Name FROM Lead');
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Done');
    }
}