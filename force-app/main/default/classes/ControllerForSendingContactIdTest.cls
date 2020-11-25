@isTest
private with sharing class ControllerForSendingContactIdTest {
  @TestSetup
  static void setData() {
    Contact contact = new Contact(FirstName = 'M', LastName = 'K');
    insert contact;
  }

  @isTest
  static void testGetContactId() {
    Id actual;
    Id expected;

    List<PagesName> values = PagesName.values();
    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    actual = cont[0].Id;

    ComponentController controller = new ComponentController();
    controller.conId = actual;
    controller.pageName = values[9].name().toLowerCase();

    Test.setCurrentPage(controller.goToNextPage());

    ControllerForSendingContactId contr = new ControllerForSendingContactId();
    expected = contr.contactId;

    System.assertEquals(expected, actual);
  }
}