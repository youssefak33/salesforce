public class EmailWhenAccountCreated {
    public static void sendMail(String emailAddress, String Subject, String Body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {emailAddress};
        mail.setToAddresses(toAddresses);
        mail.setSubject(Subject);
        mail.setPlainTextBody(Body);

        Messaging.SendEmailResult[] results = Messaging.sendEmail( new Messaging.SingleEmailMessage[] {mail});
        inspectResults(results);

    }
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResults = true;
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successufully');
            }
            else {
                sendResults = false;
                System.debug ('The following errors occurred :' + res.getErrors());
            }
        }
        return sendResults;
    }
}