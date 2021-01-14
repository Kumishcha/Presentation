@isTest
private class ComponentControllerTest {
  @isTest
  static void testGetMessage() {
    String actual;

    List<Apexpage> lst = [
      SELECT id, name
      FROM Apexpage
      WITH SECURITY_ENFORCED
      ORDER BY Name ASC
    ];
    List<PagesName> values = PagesName.values();
    Map<PagesName, String> mapOfMessages = ComponentMessages.getMap();

    for (Apexpage a : lst) {
      for (PagesName p : values) {
        if (a.name == p.name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );

          actual = mapOfMessages.get(p);

          System.Test.setCurrentPageReference(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = Label.namespacePrefix + a.name;

          System.assertEquals(controller.getMessage(), actual);
        }
      }
    }
  }

  @isTest
  static void testGoToNextPage() {
    String actualName;
    PageReference pageRefActual;

    List<Apexpage> lst = [
      SELECT id, name
      FROM Apexpage
      WITH SECURITY_ENFORCED
      ORDER BY Name ASC
    ];
    List<PagesName> values = PagesName.values();

    for (Apexpage a : lst) {
      for (Integer i = 0; i < values.size() - 1; i++) {
        if (a.name == values[i].name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );

          actualName =
            Label.namespacePrefix + values[i + 1].name().toLowercase();

          pageRefActual = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            actualName
          );

          System.Test.setCurrentPageReference(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = Label.namespacePrefix + a.name;

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

    List<Apexpage> lst = [
      SELECT id, name
      FROM Apexpage
      WITH SECURITY_ENFORCED
      ORDER BY Name DESC
    ];
    List<PagesName> values = PagesName.values();
    for (Apexpage a : lst) {
      for (Integer i = values.size() - 1; i > 0; i--) {
        if (a.name == values[i].name().toLowercase()) {
          PageReference pageRef = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            a.name
          );

          actualName =
            Label.namespacePrefix + values[i - 1].name().toLowercase();

          pageRefActual = new PageReference(
            System.Url.getSalesforceBaseUrl().toExternalForm() +
            '/apex/' +
            actualName
          );

          System.Test.setCurrentPageReference(pageRef);
          ComponentController controller = new ComponentController();
          controller.pageName = Label.namespacePrefix + a.name;

          System.assertEquals(
            controller.goToBackPage().getUrl(),
            pageRefActual.getUrl()
          );
        }
      }
    }
  }
}
