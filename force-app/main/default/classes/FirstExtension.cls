public with sharing class FirstExtension {
  public Boolean isHideForm { get; set; }
  public String contactId { get; set; }
  public Contact contact { get; set; }

  ApexPages.StandardController controller;

  public FirstExtension(ApexPages.StandardController con) {
    isHideForm = false;
    controller = con;
    contact = (Contact) controller.getRecord();
  }

  public PageReference save() {
    contact.Title = Label.titleForContacts;
    controller.save();
    contactId = controller.getId();

    PageReference pageRef = new PageReference(
      System.Url.getSalesforceBaseUrl().toExternalForm() +
      Label.URLForFirstExtension +
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
    return Label.messageForFirstExtension;
  }
}
