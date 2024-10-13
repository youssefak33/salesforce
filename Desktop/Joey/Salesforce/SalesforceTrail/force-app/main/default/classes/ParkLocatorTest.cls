@isTest
private class ParkLocatorTest {
    @IsTest static void testParksPerCountry() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        // Test.startTest();
        String s='bla';
        String[] Parks = ParkLocator.country(s);
        // Test.stopTest();

        Assert.areEqual(4, Parks.size(), 'number of parks not correct');
    }

}