public with sharing class SevenPageController {
  public Boolean isHideImage { get; set; }
  public Boolean isHideCounter { get; set; }
  public Boolean isHideFunction { get; set; }
  public Boolean isHideSupport { get; set; }
  public Boolean isHideJSRemoting { get; set; }
  public Boolean isHideContactId { get; set; }
  public String supportValue { get; set; }
  public String accountName { get; set; }
  public String contactId { get; set; }
  public String conName { get; set; }
  public String inputValue { get; set; }
  public static List<Contact> contacts { get; set; }
  public static Contact contact { get; set; }
  private String message { get; set; }
  public Boolean checkA { get; set; }
  public Boolean checkB { get; set; }
  public Boolean checkC { get; set; }
  public Boolean checkD { get; set; }
  public Boolean checkE { get; set; }
  private Integer count = 0;
  private String uname;

  public SevenPageController() {
    isHideImage = false;
    inputValue = 'type the contact name from the previous step';
    contactId = ApexPages.currentPage().getParameters().get('contactId');
  }

  @RemoteAction
  public static Contact getContact(String contactName) {
    contacts = [SELECT Id, Name FROM Contact WHERE FirstName = :contactName];
    contact = contacts[0];
    return contact;
  }

  public String getUsername() {
    return uname;
  }
  public PageReference sayHello() {
    uname = UserInfo.getName();
    return null;
  }

  public PageReference commandlink() {
    setToZero();
    message = 'you use commandlink method';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkA = true;
    return null;
  }

  public PageReference actionPoller() {
    setToZero();
    isHideCounter = true;
    message = 'you use actionPoller method';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkB = true;
    return null;
  }

  public PageReference actionFunction() {
    setToZero();
    isHideFunction = true;
    message = 'you use actionFunction method';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkC = true;
    return null;
  }

  public PageReference actionSupport() {
    setToZero();
    isHideSupport = true;
    supportValue = 'type something';
    return null;
  }

  public PageReference supportMethod() {
    message = 'you use actionSupport method';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkD = true;
    return null;
  }

  public PageReference JSRemoting() {
    setToZero();
    isHideJSRemoting = true;
    message = 'you use Javascript Remoting method';
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkE = true;
    return null;
  }

  public void remind() {
    isHideContactId = true;
    conName = [SELECT Id, FirstName FROM Contact WHERE id = :contactId]
    .FirstName;
    JSRemoting();
  }

  public void checkActionAttribute() {
    isHideImage = true;
  }

  public PageReference incrementCounter() {
    count++;
    return null;
  }

  public Integer getCount() {
    return count;
  }

  private Integer setToZero() {
    isHideCounter = false;
    isHideFunction = false;
    isHideSupport = false;
    isHideJSRemoting = false;
    count = 0;
    return count;
  }
}