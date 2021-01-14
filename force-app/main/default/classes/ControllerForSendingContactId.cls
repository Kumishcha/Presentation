public with sharing class ControllerForSendingContactId {
  public String contactId { get; set; }

  public ControllerForSendingContactId() {
    contactId = ApexPages.currentPage().getParameters().get(Label.contactId);
  }
}
