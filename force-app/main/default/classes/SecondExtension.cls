public with sharing class SecondExtension {
  public String message { get; set; }
  ApexPages.StandardController controller;

  public SecondExtension(ApexPages.StandardController con) {
    controller = con;
  }

  public PageReference save() {
    message = Label.messageForSaveMethod;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.WARNING, message)
    );
    return null;
  }

  public String getSecondExtensionMessage() {
    return Label.messageForSecondExtension;
  }
}
