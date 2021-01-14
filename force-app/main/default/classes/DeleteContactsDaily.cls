global without sharing class DeleteContactsDaily implements Schedulable {
  global DeleteContactsDaily() {
  }

  global void execute(SchedulableContext ctx) {
    Savepoint sp = Database.setSavepoint();
    try {
      List<Contact> contacts = [
        SELECT Id, Name
        FROM Contact
        WHERE Title = :Label.titleForContacts
        WITH SECURITY_ENFORCED
      ];

      delete contacts;
    } catch (Exception e) {
      Database.rollback(sp);
      System.debug(e.getMessage());
    }
  }
}
