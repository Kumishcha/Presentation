public with sharing class FirstExtension {
  public Boolean isHideForm { get; set; }
  public String contactId { get; set; }
  private String message { get; set; }

  ApexPages.StandardController controller;

  public FirstExtension(ApexPages.StandardController con) {
    isHideForm = false;
    controller = con;
  }

  public PageReference save() {
    controller.save();
    contactId = controller.getId();

    PageReference pageRef = new PageReference(
      System.Url.getSalesforceBaseUrl().toExternalForm() +
      '/apex/g_six?core.apexpages.request.devconsole=1&id=' +
      contactId
    );

    pageRef.setRedirect(true);
    return pageRef;
  }

  public PageReference createContact() {
    isHideForm = true;
    return Page.g_six;
  }

  public String getFirstExtensionMessage() {
    message = 'you use FirstExtension class';
    return message;
  }
}
