public with sharing class SecondExtension {
  private String message { get; set; }
  ApexPages.StandardController controller;

  public SecondExtension(ApexPages.StandardController con) {
    controller = con;
  }

  public PageReference save() {
    message = 'you use save method of SecondExtension class';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.WARNING, message)
    );
    return null;
  }

  public String getSecondExtensionMessage() {
    message = 'you use SecondExtension class';
    return message;
  }
}