@isTest
private class SecondExtensionTest {
  @TestSetup
  static void setData() {
    Contact contact = new Contact(FirstName = 'M', LastName = 'K');
    insert contact;
  }

  @isTest
  static void testSecondExtensionSave() {
    String actual = 'you use save method of SecondExtension class';
    String expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    SecondExtension ext = new SecondExtension(sc);
    ext.save();

    expected = ext.message;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testGetSecondExtensionMessage() {
    String actual = 'you use SecondExtension class';
    String expected;

    List<Contact> cont = [SELECT Id, Name FROM Contact LIMIT 1];

    Apexpages.StandardController sc = new Apexpages.StandardController(cont[0]);
    SecondExtension ext = new SecondExtension(sc);
    ext.getSecondExtensionMessage();

    expected = ext.message;

    System.assertEquals(expected, actual);
  }
}
