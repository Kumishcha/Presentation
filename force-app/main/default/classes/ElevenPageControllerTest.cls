@isTest
private class ElevenPageControllerTest {
  @TestSetup
  static void setData() {
    Contact contact = new Contact(FirstName = 'M', LastName = 'K');
    insert contact;
  }

  @isTest
  static void testGetContactId() {
    Id actual;
    Id expected;
    String namespacePrefix = 'kvk__';

    List<PagesName> values = PagesName.values();
    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    actual = cont[0].Id;

    ComponentController controller = new ComponentController();
    controller.conId = actual;
    controller.pageName = namespacePrefix + values[9].name().toLowerCase();

    System.Test.setCurrentPage(controller.goToNextPage());

    ElevenPageController contr = new ElevenPageController();
    expected = contr.contactId;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testCommandlink() {
    String actual = 'https://help.salesforce.com/articleView?id=code_dev_console_tab_view_state.htm&type=5';
    String expected;

    ElevenPageController contr = new ElevenPageController();
    expected = contr.commandlink().getUrl();

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testClosePopup() {
    Boolean actual = false;
    Boolean expected;

    ElevenPageController contr = new ElevenPageController();
    contr.closePopup();
    expected = contr.displayPopup;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testShowPopup() {
    Boolean actual = true;
    Boolean expected;

    ElevenPageController contr = new ElevenPageController();
    contr.showPopup();
    expected = contr.displayPopup;

    System.assertEquals(expected, actual);
  }
}
