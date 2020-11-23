public with sharing class ComponentController {
  public String pageName { get; set; }
  public String conId { get; set; }
  private String message { get; set; }

  public ComponentController() {
  }

  public String getMessage() {
    if (pageName == ConstantsForPresentation.TITLE_PAGE) {
      message = '';
    } else if (pageName == ConstantsForPresentation.ONE) {
      message = 'What is Visualforce? Visualforce System Architecture - Standard User Mode';
    } else if (pageName == ConstantsForPresentation.TWO) {
      message = 'What is a Visualforce Page? Where You Can Use Visualforce Page?';
    } else if (pageName == ConstantsForPresentation.THREE) {
      message = 'Create & Edit Visualforce Pages';
    } else if (pageName == ConstantsForPresentation.FOUR) {
      message = 'Standard Controllers VS Custom Controllers';
    } else if (pageName == ConstantsForPresentation.FIVE) {
      message = 'Standard Controller, Controller Extensions, Custom Component, Order of Execution';
    } else if (pageName == ConstantsForPresentation.SIX) {
      message = 'Create new Contact to open next page';
    } else if (pageName == ConstantsForPresentation.SEVEN) {
      message = 'Ways to call controller methods(check each function to open next page)';
    } else if (pageName == ConstantsForPresentation.EIGHT) {
      message = 'Using Aura & LWC in Visualforce Pages';
    } else if (pageName == ConstantsForPresentation.NINE) {
      message = 'Using CSS in Visualforce Pages. Visualforce provides 4 types of stylesheets:';
    } else if (pageName == ConstantsForPresentation.TEN) {
      message = 'Using JavaScript with Visualforce Pages';
    } else if (pageName == ConstantsForPresentation.ELEVEN) {
      message = 'Visualforce Page’s View State';
    } else if (pageName == ConstantsForPresentation.TWELVE) {
      message = 'Ways to reduce the view state';
    } else if (pageName == ConstantsForPresentation.THIRTEEN) {
      message = 'Visualforce Pages Limits';
    } else if (pageName == ConstantsForPresentation.FOURTEEN) {
      message = 'Resources';
    }
    return message;
  }

  public PageReference goToNextPage() {
    PageReference pageRef;
    if (pageName == ConstantsForPresentation.TITLE_PAGE) {
      pageRef = Page.one;
    } else if (pageName == ConstantsForPresentation.ONE) {
      pageRef = Page.two;
    } else if (pageName == ConstantsForPresentation.TWO) {
      pageRef = Page.three;
    } else if (pageName == ConstantsForPresentation.THREE) {
      pageRef = Page.four;
    } else if (pageName == ConstantsForPresentation.FOUR) {
      pageRef = Page.five;
    } else if (pageName == ConstantsForPresentation.FIVE) {
      pageRef = Page.six;
    } else if (pageName == ConstantsForPresentation.SIX) {
      pageRef = Page.seven;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.SEVEN) {
      pageRef = Page.eight;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.EIGHT) {
      pageRef = Page.nine;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.NINE) {
      pageRef = Page.ten;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.TEN) {
      pageRef = Page.eleven;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.ELEVEN) {
      pageRef = Page.twelve;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.TWELVE) {
      pageRef = Page.thirteen;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.THIRTEEN) {
      pageRef = Page.fourteen;
      pageRef.getParameters().put('contactId', conId);
    }
    pageRef.setRedirect(true);
    return pageRef;
  }

  public PageReference goToBackPage() {
    PageReference pageRef;

    if (pageName == ConstantsForPresentation.ONE) {
      pageRef = Page.titlePage;
    } else if (pageName == ConstantsForPresentation.TWO) {
      pageRef = Page.one;
    } else if (pageName == ConstantsForPresentation.THREE) {
      pageRef = Page.two;
    } else if (pageName == ConstantsForPresentation.FOUR) {
      pageRef = Page.three;
    } else if (pageName == ConstantsForPresentation.FIVE) {
      pageRef = Page.four;
    } else if (pageName == ConstantsForPresentation.SIX) {
      pageRef = Page.five;
    } else if (pageName == ConstantsForPresentation.SEVEN) {
      pageRef = Page.six;
    } else if (pageName == ConstantsForPresentation.EIGHT) {
      pageRef = Page.seven;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.NINE) {
      pageRef = Page.eight;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.TEN) {
      pageRef = Page.nine;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.ELEVEN) {
      pageRef = Page.ten;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.TWELVE) {
      pageRef = Page.eleven;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.THIRTEEN) {
      pageRef = Page.twelve;
      pageRef.getParameters().put('contactId', conId);
    } else if (pageName == ConstantsForPresentation.FOURTEEN) {
      pageRef = Page.thirteen;
      pageRef.getParameters().put('contactId', conId);
    }
    pageRef.setRedirect(true);
    return pageRef;
  }
}