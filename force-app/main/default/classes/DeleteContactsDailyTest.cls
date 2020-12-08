@isTest
private class DeleteContactsDailyTest {
  public static String CRON_EXP = '0 0 0 15 3 ? 2022';

  static testMethod void testScheduledJob() {
    List<Contact> contacts = new List<Contact>();

    for (Integer i = 0; i < 10; i++) {
      Contact con = new Contact(
        FirstName = 'Name ' + i,
        LastName = 'Last Name ' + i,
        Title = 'Visualforce presentation'
      );
      contacts.add(con);
    }
    insert contacts;

    System.Test.startTest();

    String jobId = System.schedule(
      'ScheduledApexTest',
      CRON_EXP,
      new DeleteContactsDaily()
    );
    System.Test.stopTest();

    List<Contact> expected = [
      SELECT Id, Name
      FROM Contact
      WHERE Title = 'Visualforce presentation'
    ];

    System.assertEquals(0, expected.size());
  }
}
