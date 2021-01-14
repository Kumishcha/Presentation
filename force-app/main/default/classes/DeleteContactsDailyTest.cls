@isTest
private class DeleteContactsDailyTest {
  static testMethod void testScheduledJob() {
    List<Contact> contacts = new List<Contact>();

    Savepoint sp = Database.setSavepoint();
    try {
      for (Integer i = 0; i < 10; i++) {
        Contact con = new Contact(
          FirstName = 'Name ' + i,
          LastName = 'Last Name ' + i,
          Title = Label.titleForContacts
        );
        contacts.add(con);
      }
      insert contacts;
    } catch (Exception e) {
      Database.rollback(sp);
      System.debug(e.getMessage());
    }

    System.Test.startTest();

    String jobId = System.schedule(
      Label.nameScheduledApexTest,
      Label.testCRON_EXP,
      new DeleteContactsDaily()
    );
    System.Test.stopTest();

    List<Contact> expected = [
      SELECT Id, Name
      FROM Contact
      WHERE Title = :Label.titleForContacts
      WITH SECURITY_ENFORCED
    ];

    System.assertEquals(0, expected.size());
  }
}
