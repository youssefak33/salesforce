trigger TriggerNewAccounts on Account (after insert, after delete) {
    for (Account acc : Trigger.new) {
        String AccName = acc.Name;
        
        if (Trigger.isInsert) {
            Integer recordCound = Trigger.new.size();
            Account[] IdOwner = [SELECT OwnerId FROM Account WHERE Name=:AccName];
            String IdOwnerCasting = IdOwner[0].OwnerId;
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwnerCasting];
            String EmailCasting = EmailOwner[0].Id;
            EmailWhenAccountCreated.sendMail(EmailCasting, 'New Account Created', recordCound + 'Account were inserted');
        }
        else if (Trigger.isDelete) {
            Integer recordCound = Trigger.old.size();
            Account[] IdOwner = [SELECT OwnerId FROM Account WHERE Name=:AccName];
            String IdOwnerCasting = IdOwner[0].OwnerId;
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwnerCasting];
            String EmailCasting = EmailOwner[0].Id;
            EmailWhenAccountCreated.sendMail(EmailCasting, 'Account Deleted', recordCound + 'Account were deleted');
        }
    }

}