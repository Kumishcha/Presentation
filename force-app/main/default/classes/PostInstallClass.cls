global class PostInstallClass implements InstallHandler {
  global void onInstall(InstallContext context) {
    if (context.previousVersion() == null) {
      System.schedule(
        'Delete contacts',
        '0 0 6 * * ? *',
        new DeleteContactsDaily()
      );

      User u = [SELECT Id, Email FROM User WHERE Id = :context.installerID()];
      String toAddress = u.Email;
      String[] toAddresses = new List<String>{ toAddress };
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      mail.setToAddresses(toAddresses);
      mail.setReplyTo('support@package.dev');
      mail.setSenderDisplayName('My Package Support');
      mail.setSubject('Package install successful');
      mail.setPlainTextBody('Thanks for installing the package.');
      Messaging.sendEmail(new List<Messaging.Email>{ mail });
    } else if (context.previousVersion().compareTo(new Version(1, 0)) == 0) {
    }
    if (context.isUpgrade()) {
    }
    if (context.isPush()) {
    }
  }
}
