public with sharing class ThirteenPageController {
  public String contactId { get; set; }

  public ThirteenPageController() {
    contactId = ApexPages.currentPage().getParameters().get('contactId');
  }

  public List<Limit__c> getLimits() {
    return [SELECT Id, Description__c, Value__c FROM Limit__c LIMIT 9];
  }

  public List<Limit__c> getLimitsSecondPart() {
    return [SELECT Id, Description__c, Value__c FROM Limit__c OFFSET 9];
  }
}