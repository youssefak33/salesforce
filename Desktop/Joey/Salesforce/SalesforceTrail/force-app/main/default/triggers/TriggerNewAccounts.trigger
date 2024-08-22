trigger TriggerNewAccounts on Account (after insert, after delete) {
    for (Account acc : Trigger.new) {
        String IdOwner = acc.OwnerId;
        
        if (Trigger.isInsert) {
            Integer recordCound = Trigger.new.size();
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwner];
            if (!EmailOwner.isEmpty()) {
                String EmailCasting = EmailOwner[0].Email;
                EmailWhenAccountCreated.sendMail(EmailCasting, 'New Account Created', recordCound + 'Account were inserted');
            }
        }
        else if (Trigger.isDelete) {
            Integer recordCound = Trigger.new.size();
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwner];
            if (!EmailOwner.isEmpty()) {
                String EmailCasting = EmailOwner[0].Email;
                EmailWhenAccountCreated.sendMail(EmailCasting, 'Account Deleted', recordCound + 'Account were deleted');
            }
        }
    }

}