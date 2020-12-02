global class DeleteContactsDaily implements Schedulable {
  global void execute(SchedulableContext ctx) {
    List<Contact> contacts = [
      SELECT Id, Name
      FROM Contact
      WHERE Title = 'Visualforce presentation'
    ];

    delete contacts;
  }
}
