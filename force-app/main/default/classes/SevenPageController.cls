public with sharing class SevenPageController {
  public Boolean isHideImage { get; set; }
  public Boolean isHideCounter { get; set; }
  public Boolean isHideFunction { get; set; }
  public Boolean isHideSupport { get; set; }
  public Boolean isHideJSRemoting { get; set; }
  public Boolean isHideContactId { get; set; }
  public String supportValue { get; set; }
  public String contactId { get; set; }
  public String conName { get; set; }
  public static List<Contact> contacts { get; set; }
  public static Contact contact { get; set; }
  public String message { get; set; }
  public Boolean checkA { get; set; }
  public Boolean checkB { get; set; }
  public Boolean checkC { get; set; }
  public Boolean checkD { get; set; }
  public Boolean checkE { get; set; }
  private Integer count = 0;
  private String uname;

  public SevenPageController() {
    isHideImage = false;
    contactId = ApexPages.currentPage().getParameters().get(Label.contactId);
  }

  @RemoteAction
  public static Contact getContact(String contactName) {
    contacts = [
      SELECT Id, Name
      FROM Contact
      WHERE FirstName = :contactName
      WITH SECURITY_ENFORCED
    ];
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
    message = Label.messageForCommandlink;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkA = true;
    return null;
  }

  public PageReference actionPoller() {
    setToZero();
    isHideCounter = true;
    message = Label.messageForActionPoller;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkB = true;
    return null;
  }

  public PageReference actionFunction() {
    setToZero();
    isHideFunction = true;
    message = Label.messageForActionFunction;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkC = true;
    return null;
  }

  public PageReference actionSupport() {
    setToZero();
    isHideSupport = true;
    supportValue = Label.messageForHelpActionSupport;
    return null;
  }

  public PageReference supportMethod() {
    message = Label.messageForActionSupport;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkD = true;
    return null;
  }

  public PageReference JSRemoting() {
    setToZero();
    isHideJSRemoting = true;
    message = Label.messageForJSRemoting;
    ApexPages.addMessage(
      new ApexPages.message(ApexPages.severity.CONFIRM, message)
    );
    checkE = true;
    return null;
  }

  public void remind() {
    isHideContactId = true;
    conName = [
      SELECT Id, FirstName
      FROM Contact
      WHERE id = :contactId
      WITH SECURITY_ENFORCED
    ]
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
