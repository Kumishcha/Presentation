global with sharing class UnInstallClass implements UninstallHandler {
  global void onUninstall(UninstallContext ctx) {
    String SCHEDULE_NAME = 'Delete contacts';
    id cronid = System.schedule(
      SCHEDULE_NAME,
      '0 0 6 * * ? *',
      new DeleteContactsDaily()
    );
    System.abortJob(cronid);

    User u = [SELECT Id, Email FROM User WHERE Id = :ctx.uninstallerID()];
    String toAddress = u.Email;
    String[] toAddresses = new List<String>{ toAddress };
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setToAddresses(toAddresses);
    mail.setReplyTo('support@package.dev');
    mail.setSenderDisplayName('My Package Support');
    mail.setSubject('Package uninstall successful');
    mail.setPlainTextBody('Thanks for uninstalling the package.');
    Messaging.sendEmail(new List<Messaging.Email>{ mail });
  }
}
