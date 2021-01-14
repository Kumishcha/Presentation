global with sharing class UnInstallClass implements UninstallHandler {
  global void onUninstall(UninstallContext ctx) {
    id cronid = System.schedule(
      Label.SCHEDULE_NAME,
      Label.SCHEDULE_CRON_EXP,
      new DeleteContactsDaily()
    );
    System.abortJob(cronid);

    User u = [
      SELECT Id, Email
      FROM User
      WHERE Id = :ctx.uninstallerID()
      WITH SECURITY_ENFORCED
    ];
    String toAddress = u.Email;
    String[] toAddresses = new List<String>{ toAddress };
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setToAddresses(toAddresses);
    mail.setReplyTo(Label.post_unInstallReplyTo);
    mail.setSenderDisplayName(Label.post_unInstallSenderDisplayName);
    mail.setSubject(Label.unInstallSubject);
    mail.setPlainTextBody(Label.unInstallPlainTextBody);
    Messaging.sendEmail(new List<Messaging.Email>{ mail });
  }
}
