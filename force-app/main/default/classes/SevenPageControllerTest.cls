@isTest
private class SevenPageControllerTest {
  @TestSetup
  static void setData() {
    Savepoint sp = Database.setSavepoint();
    try {
      Contact contact = new Contact(FirstName = 'M', LastName = 'K');
      insert contact;
    } catch (Exception e) {
      Database.rollback(sp);
      System.debug(e.getMessage());
    }
  }

  @isTest
  static void testGetContactId() {
    Id actual;
    Id expected;

    List<PagesName> values = PagesName.values();
    List<Contact> cont = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED];

    actual = cont[0].Id;

    ComponentController controller = new ComponentController();
    controller.conId = actual;
    controller.pageName =
      Label.namespacePrefix + values[7].name().toLowerCase();

    System.Test.setCurrentPage(controller.goToNextPage());

    SevenPageController contr = new SevenPageController();
    expected = contr.contactId;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testGetContact() {
    Id actual;
    Id expected;
    String firstName;

    List<Contact> cont = [
      SELECT Id, FirstName
      FROM Contact
      WITH SECURITY_ENFORCED
    ];
    actual = cont[0].Id;
    firstName = cont[0].FirstName;

    expected = SevenPageController.getContact(firstName).Id;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testSayHello() {
    String actual;
    String expected;
    PageReference ref;

    actual = UserInfo.getName();

    SevenPageController contr = new SevenPageController();
    ref = contr.sayHello();
    expected = contr.getUsername();

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testCommandlink() {
    Boolean actual;
    Boolean expected;
    String actualMessage;
    String expectedMessage;
    PageReference ref;

    actual = true;
    actualMessage = Label.messageForCommandlink;

    SevenPageController contr = new SevenPageController();
    ref = contr.commandlink();
    expected = contr.checkA;
    expectedMessage = contr.message;

    System.assertEquals(expected, actual);
    System.assertEquals(expectedMessage, actualMessage);
  }

  @isTest
  static void testActionPoller() {
    Boolean actual;
    Boolean expected;
    String actualMessage;
    String expectedMessage;
    PageReference ref;

    actual = true;
    actualMessage = Label.messageForActionPoller;

    SevenPageController contr = new SevenPageController();
    ref = contr.actionPoller();
    expected = contr.checkB;
    expectedMessage = contr.message;

    System.assertEquals(expected, actual);
    System.assertEquals(expectedMessage, actualMessage);
  }

  @isTest
  static void testActionFunction() {
    Boolean actual;
    Boolean expected;
    String actualMessage;
    String expectedMessage;
    PageReference ref;

    actual = true;
    actualMessage = Label.messageForActionFunction;

    SevenPageController contr = new SevenPageController();
    ref = contr.actionFunction();
    expected = contr.checkC;
    expectedMessage = contr.message;

    System.assertEquals(expected, actual);
    System.assertEquals(expectedMessage, actualMessage);
  }

  @isTest
  static void testActionSupport() {
    Boolean actual;
    Boolean expected;
    String actualMessage;
    String expectedMessage;
    PageReference ref;

    actual = true;
    actualMessage = Label.messageForActionSupport;

    SevenPageController contr = new SevenPageController();
    ref = contr.actionSupport();
    ref = contr.supportMethod();
    expected = contr.checkD;
    expectedMessage = contr.message;

    System.assertEquals(expected, actual);
    System.assertEquals(expectedMessage, actualMessage);
  }

  @isTest
  static void testJSRemoting() {
    Boolean actual;
    Boolean expected;
    String actualMessage;
    String expectedMessage;
    PageReference ref;

    actual = true;
    actualMessage = Label.messageForJSRemoting;

    SevenPageController contr = new SevenPageController();
    contr.contactId = [SELECT Id, Name FROM Contact WITH SECURITY_ENFORCED][0]
    .Id;
    ref = contr.JSRemoting();
    contr.remind();
    expected = contr.checkE;
    expectedMessage = contr.message;

    System.assertEquals(expected, actual);
    System.assertEquals(expectedMessage, actualMessage);
  }

  @isTest
  static void testCheckActionAttribute() {
    Boolean actual = true;
    Boolean expected;

    SevenPageController contr = new SevenPageController();
    contr.checkActionAttribute();
    expected = contr.isHideImage;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testCheckCounter() {
    Integer count = 1;
    Integer actual = count++;
    Integer expected;
    PageReference ref;

    SevenPageController contr = new SevenPageController();
    ref = contr.incrementCounter();
    expected = contr.getCount();

    System.assertEquals(expected, actual);
  }
}
