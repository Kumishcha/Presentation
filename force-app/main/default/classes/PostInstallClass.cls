global class PostInstallClass implements InstallHandler {
  global void onInstall(InstallContext context) {
    if (context.previousVersion() == null) {
      System.schedule(
        Label.SCHEDULE_NAME,
        Label.SCHEDULE_CRON_EXP,
        new DeleteContactsDaily()
      );

      User u = [
        SELECT Id, Email
        FROM User
        WHERE Id = :context.installerID()
        WITH SECURITY_ENFORCED
      ];
      String toAddress = u.Email;
      String[] toAddresses = new List<String>{ toAddress };
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      mail.setToAddresses(toAddresses);
      mail.setReplyTo(Label.post_unInstallReplyTo);
      mail.setSenderDisplayName(Label.post_unInstallSenderDisplayName);
      mail.setSubject(Label.postInstallSubject);
      mail.setPlainTextBody(Label.postInstallPlainTextBody);
      Messaging.sendEmail(new List<Messaging.Email>{ mail });
    } else if (context.previousVersion().compareTo(new Version(1, 0)) == 0) {
    }
    if (context.isUpgrade()) {
    }
    if (context.isPush()) {
    }
  }
}
