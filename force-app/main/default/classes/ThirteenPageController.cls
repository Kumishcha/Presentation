public with sharing class ThirteenPageController {
  public Boolean displayPopup { get; set; }
  public Boolean isHide { get; set; }
  public String contactId { get; set; }

  public ThirteenPageController() {
    contactId = ApexPages.currentPage().getParameters().get(Label.contactId);

    if (getLimits().size() > 0) {
      isHide = true;
    }
  }

  public List<Limit__c> getLimits() {
    return [
      SELECT Id, kvk__Description__c, kvk__Value__c
      FROM kvk__Limit__c
      WITH SECURITY_ENFORCED
      LIMIT 11
    ];
  }

  public List<Limit__c> getLimitsSecondPart() {
    return [
      SELECT Id, kvk__Description__c, kvk__Value__c
      FROM kvk__Limit__c
      WITH SECURITY_ENFORCED
      OFFSET 11
    ];
  }

  public void closePopup() {
    displayPopup = false;
  }

  public void showPopup() {
    displayPopup = true;
  }
}
