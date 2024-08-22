trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    Task[] TaskOfOpp = new List<Task>();
    Opportunity[] OpportunitiesForTask = [SELECT Id, Name, StageName FROM Opportunity WHERE Id IN :trigger.new];
    for (Opportunity op : OpportunitiesForTask) {
        if (op.StageName == 'Closed Won') {
            TaskOfOpp.add(new Task(Subject='Follow Up Test Task', WhatId=op.Id));
        }
    }
    if (TaskOfOpp.size() >= 200) {
        insert TaskOfOpp;
    }
}
