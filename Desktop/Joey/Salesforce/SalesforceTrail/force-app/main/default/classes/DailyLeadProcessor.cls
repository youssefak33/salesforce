public with sharing class DailyLeadProcessor implements Schedulable{

    public void execute(SchedulableContext context) {

        Lead[] leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }

        update leads;

    }
}