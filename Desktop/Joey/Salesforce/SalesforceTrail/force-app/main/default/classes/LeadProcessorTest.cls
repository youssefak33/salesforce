@isTest
private class LeadProcessorTest {
    
    @isTest
    private static void TestLeadProcessorClass() {
        
        // insert 200 leads in the org
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Cannock', Company='Salesforce'));
        }
        insert leads;
    
        Test.startTest();
        LeadProcessor updateAllLeads = new LeadProcessor();
        Id batchId = Database.executeBatch(updateAllLeads, 200);
        Test.stopTest();

        // assert
        List<Lead> AllUpdatedLeads = [SELECT id FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(200, AllUpdatedLeads.size(), 'Error ');
    }
}