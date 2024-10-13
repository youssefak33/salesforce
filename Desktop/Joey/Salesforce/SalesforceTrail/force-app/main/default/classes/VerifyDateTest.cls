@isTest
private class TestVerifyDate {
    @isTest
    static void VerifyWithin30DaysTest() {
        Date date1 = date.newInstance(2024, 10, 3);
        Date date2 = date.newInstance(2024, 10, 28);
        Date within30Days = VerifyDate.CheckDates(date1 , date2 );
        System.assertEquals(date2 , within30Days);
    }

    @isTest
    static void VerifyAfter30DaysTest() {
        Date date1 = date.newInstance(2024, 10, 3);
        Date date2 = date.newInstance(2024, 11, 10);
        Date notWithin30Days = VerifyDate.CheckDates(date1 , date2);
        Date date3 = date.newInstance(2024, 10, 31);
        System.assertEquals(date3, notWithin30Days);
    }

    @isTest
    static void VerifyDate2BeforeDate1Test() {
        Date date1 = date.newInstance(2024, 11, 3);
        Date date2 = date.newInstance(2024, 10, 10);
        Date notWithin30Days = VerifyDate.CheckDates(date1 , date2);
        Date date3 = date.newInstance(2024, 11, 30);
        System.assertEquals(date3, notWithin30Days, 'Date2 is before Date1');
    }

}