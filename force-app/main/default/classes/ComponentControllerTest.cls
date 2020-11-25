@isTest
private with sharing class ComponentControllerTest {
  @isTest
  static void testGetMessage() {
    List<Apexpage> lst = [SELECT id, name FROM Apexpage ORDER BY Name ASC];
    List<PagesName> values = PagesName.values();
    Map<PagesName, String> mapOfMessages = ComponentMessages.getMap();
    String actual;

    for (Apexpage a : lst) {
      for (PagesName p : values) {
        if (a.name == p.name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );

          actual = mapOfMessages.get(p);

          Test.setCurrentPage(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = a.name;

          System.assertEquals(controller.getMessage(), actual);
        }
      }
    }
  }

  @isTest
  static void testGoToNextPage() {
    String actualName;
    PageReference pageRefActual;

    List<Apexpage> lst = [SELECT id, name FROM Apexpage ORDER BY Name ASC];
    List<PagesName> values = PagesName.values();
    for (Apexpage a : lst) {
      for (Integer i = 0; i < values.size() - 1; i++) {
        if (a.name == values[i].name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );
          actualName = values[i + 1].name().toLowercase();

          pageRefActual = new PageReference('/apex/' + actualName);
          Test.setCurrentPage(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = a.name;

          System.assertEquals(
            controller.goToNextPage().getUrl(),
            pageRefActual.getUrl()
          );
        }
      }
    }
  }

  @isTest
  static void testGoToBackPage() {
    String actualName;
    PageReference pageRefActual;

    List<Apexpage> lst = [SELECT id, name FROM Apexpage ORDER BY Name DESC];
    List<PagesName> values = PagesName.values();
    for (Apexpage a : lst) {
      for (Integer i = values.size() - 1; i > 0; i--) {
        if (a.name == values[i].name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );
          actualName = values[i - 1].name().toLowercase();

          pageRefActual = new PageReference('/apex/' + actualName);
          Test.setCurrentPage(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = a.name;
          System.debug(controller.goToBackPage().getUrl());
          System.assertEquals(
            controller.goToBackPage().getUrl(),
            pageRefActual.getUrl()
          );
        }
      }
    }
  }
}