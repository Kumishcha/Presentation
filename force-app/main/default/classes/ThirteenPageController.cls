public with sharing class ThirteenPageController {
  public Boolean displayPopup { get; set; }
  public Boolean isHide { get; set; }
  public String contactId { get; set; }

  public ThirteenPageController() {
    contactId = ApexPages.currentPage().getParameters().get('contactId');

    if (getLimits().size() > 0) {
      isHide = true;
    }
  }

  public List<Limit__c> getLimits() {
    return [SELECT Id, Description__c, Value__c FROM Limit__c LIMIT 11];
  }

  public List<Limit__c> getLimitsSecondPart() {
    return [SELECT Id, Description__c, Value__c FROM Limit__c OFFSET 11];
  }

  public void closePopup() {
    displayPopup = false;
  }

  public void showPopup() {
    displayPopup = true;
  }
}
