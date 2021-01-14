@isTest
private class PostInstallClassTest {
  @isTest
  static void testInstallScript() {
    PostInstallClass postinstall = new PostInstallClass();
    Test.testInstall(postinstall, null);
    Test.testInstall(postinstall, new Version(1, 0), true);
    List<Contact> contacts = [
      SELECT Id, Name
      FROM Contact
      WHERE Title = :Label.titleForContacts
      WITH SECURITY_ENFORCED
    ];

    System.assertEquals(contacts.size(), 0);
  }
}
