@isTest
private class AnimalLocatorTest {
    @isTest public static Void getAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);

        System.Assert.areEqual('chicken', response);
}
    @isTest public static Void getAnimalNameByIdFail() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(2);

        System.Assert.areEqual('chicken', response, 'The resource doesnt exist : ');
    }
    
}