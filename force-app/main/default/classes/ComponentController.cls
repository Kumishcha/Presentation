public with sharing class ComponentController {
  public String pageName { get; set; }
  public String conId { get; set; }
  private String message { get; set; }
  private List<PagesName> values = PagesName.values();

  public ComponentController() {
  }

  public String getMessage() {
    Map<PagesName, String> mapOfMessages = ComponentMessages.getMap();

    for (PagesName name : values) {
      if (pageName == Label.namespacePrefix + name.name().toLowercase()) {
        message = mapOfMessages.get(name);
      }
    }
    return message;
  }

  public PageReference goToNextPage() {
    PageReference pageRef;

    for (Integer i = 0; i < values.size() - 1; i++) {
      if (pageName == Label.namespacePrefix + values[i].name().toLowercase()) {
        pageRef = new PageReference(
          System.Url.getSalesforceBaseUrl().toExternalForm() +
          '/apex/' +
          Label.namespacePrefix +
          values[i + 1].name().toLowercase()
        );
        pageRef.getParameters().put(Label.contactId, conId);
      }
    }
    pageRef.setRedirect(true);
    return pageRef;
  }

  public PageReference goToBackPage() {
    PageReference pageRef;

    for (Integer i = values.size() - 1; i > 0; i--) {
      if (pageName == Label.namespacePrefix + values[i].name().toLowercase()) {
        pageRef = new PageReference(
          System.Url.getSalesforceBaseUrl().toExternalForm() +
          '/apex/' +
          Label.namespacePrefix +
          values[i - 1].name().toLowercase()
        );
        pageRef.getParameters().put(Label.contactId, conId);
      }
    }
    pageRef.setRedirect(true);
    return pageRef;
  }
}
