@isTest
private class ThirteenPageControllerTest {
  @TestSetup
  static void setData() {
    List<kvk__Limit__c> listToInsert = new List<Limit__c>();

    for (Integer i = 0; i < 18; i++) {
      listToInsert.add(
        new kvk__Limit__c(
          kvk__Description__c = 'Item',
          kvk__Value__c = 'value' + i
        )
      );
    }
    insert listToInsert;
  }

  @isTest
  static void testGetLimits() {
    Integer actual = 11;
    Integer expected = 0;
    ThirteenPageController controller = new ThirteenPageController();

    for (Limit__c l : controller.getLimits()) {
      expected++;
    }

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testGetLimitsSecondPart() {
    Integer actual = 18;
    Integer expected = 11;
    ThirteenPageController controller = new ThirteenPageController();

    for (Limit__c l : controller.getLimitsSecondPart()) {
      expected++;
    }

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testClosePopup() {
    Boolean actual = false;
    Boolean expected;

    ThirteenPageController contr = new ThirteenPageController();
    contr.closePopup();
    expected = contr.displayPopup;

    System.assertEquals(expected, actual);
  }

  @isTest
  static void testShowPopup() {
    Boolean actual = true;
    Boolean expected;

    ThirteenPageController contr = new ThirteenPageController();
    contr.showPopup();
    expected = contr.displayPopup;

    System.assertEquals(expected, actual);
  }
}
