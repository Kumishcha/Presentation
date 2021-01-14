@isTest
private class ElevenPageControllerTest {
  @TestSetup
  static void setData() {
    Savepoint sp = Database.setSavepoint();
    try {
      Contact contact = new Contact(FirstName = 'M', LastName = 'K');
      insert contact;
    } catch (Exception e) {
      Database.rollback(sp);
      System.debug(e.getMessage());
    }
  }

  @isTest
  static void testGetContactId() {
    Id actual;
    Id expected;

    List<PagesName> values = PagesName.values();
    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    actual = cont[0].Id;

    ComponentController controller = new ComponentController();
    controller.conId = actual;
    controller.pageName =
      Label.namespacePrefix + values[9].name().toLowerCase();

    System.Test.setCurrentPage(controller.goToNextPage());

    ElevenPageController contr = new ElevenPageController();
    expected = contr.contactId;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testCommandlink() {
    String actual = Label.articleViewState;
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
