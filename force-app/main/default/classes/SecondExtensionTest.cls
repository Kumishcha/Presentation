@isTest
private class SecondExtensionTest {
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
  static void testSecondExtensionSave() {
    String actual = Label.messageForSaveMethod;
    String expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    SecondExtension ext = new SecondExtension(sc);
    ext.save();

    expected = ext.message;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testGetSecondExtensionMessage() {
    String actual = Label.messageForSecondExtension;
    String expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    SecondExtension ext = new SecondExtension(sc);

    expected = ext.getSecondExtensionMessage();

    System.assertEquals(expected, actual);
  }
}
