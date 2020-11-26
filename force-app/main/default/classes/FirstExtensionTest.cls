@isTest
private class FirstExtensionTest {
  @TestSetup
  static void setData() {
    Contact contact = new Contact(FirstName = 'M', LastName = 'K');
    insert contact;
  }

  @isTest
  static void testSave() {
    Id actual;
    Id expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];
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
    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    FirstExtension contr = new FirstExtension(sc);
    contr.createContact();
    expected = contr.isHideForm;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testgGetFirstExtensionMessage() {
    String actual = 'you use FirstExtension class';
    String expected;
    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    FirstExtension contr = new FirstExtension(sc);
    expected = contr.getFirstExtensionMessage();

    System.assertEquals(expected, actual);
  }
}
