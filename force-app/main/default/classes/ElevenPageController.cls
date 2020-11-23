public with sharing class ElevenPageController {
  public Boolean displayPopup { get; set; }
  public String contactId { get; set; }

  public ElevenPageController() {
    contactId = ApexPages.currentPage().getParameters().get('contactId');
  }

  public PageReference commandlink() {
    PageReference pageRef = new pagereference(
      'https://help.salesforce.com/articleView?id=code_dev_console_tab_view_state.htm&type=5'
    );
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