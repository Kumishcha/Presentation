public with sharing class ElevenPageController {
  public Boolean displayPopup { get; set; }
  public String contactId { get; set; }

  public ElevenPageController() {
    contactId = ApexPages.currentPage().getParameters().get(Label.contactId);
  }

  public PageReference commandlink() {
    PageReference pageRef = new pagereference(Label.articleViewState);
    pageRef.setRedirect(true);
    return pageRef;
  }

  public void closePopup() {
    displayPopup = false;
  }

  public void showPopup() {
    displayPopup = true;
  }
}
