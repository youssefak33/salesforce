trigger AccountAddressTrigger on account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (acc.Match_Billing_Address__c == true){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
}

}