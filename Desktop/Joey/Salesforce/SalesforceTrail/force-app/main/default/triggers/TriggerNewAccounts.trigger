trigger TriggerNewAccounts on Account (after insert, after delete) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
        for (Account acc : Trigger.new) {
            String IdOwner = acc.OwnerId;
            Integer recordCound = Trigger.new.size();
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwner];
            if (!EmailOwner.isEmpty()) {
                String EmailCasting = EmailOwner[0].Email;
                EmailWhenAccountCreated.sendMail(EmailCasting, 'New Account Created', recordCound + 'Account were inserted');
            }
            }
        }
        when AFTER_DELETE {
        for (Account acc : Trigger.old) {
            String IdOwner = acc.OwnerId;
            Integer recordCound = Trigger.old.size();
            User[] EmailOwner = [SELECT Email FROM User WHERE Id=:IdOwner];
            if (!EmailOwner.isEmpty()) {
                String EmailCasting = EmailOwner[0].Email;
                EmailWhenAccountCreated.sendMail(EmailCasting, 'Account Deleted', recordCound + 'Account were deleted');
            }
        }
    }
    }
}
