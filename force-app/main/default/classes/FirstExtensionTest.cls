@isTest
private class FirstExtensionTest {
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
  static void testSave() {
    Id actual;
    Id expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];
    actual = cont[0].Id;

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    FirstExtension ext = new FirstExtension(sc);
    ext.save();

    expected = ext.contactId;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testCreateContact() {
    Boolean actual = true;
    Boolean expected;
    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    FirstExtension contr = new FirstExtension(sc);
    contr.createContact();
    expected = contr.isHideForm;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testgGetFirstExtensionMessage() {
    String actual = Label.messageForFirstExtension;
    String expected;
    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    FirstExtension contr = new FirstExtension(sc);
    expected = contr.getFirstExtensionMessage();

    System.assertEquals(expected, actual);
  }
}
