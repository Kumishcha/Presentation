public with sharing class ComponentController {
  public String pageName { get; set; }
  public String conId { get; set; }
  private String message { get; set; }
  private String namespacePrefix;

  public ComponentController() {
    namespacePrefix = 'kvk__';
  }

  public String getMessage() {
    Map<PagesName, String> mapOfMessages = ComponentMessages.getMap();

    if (pageName == namespacePrefix + PagesName.A_TITLE.name().toLowercase()) {
      message = mapOfMessages.get(PagesName.A_TITLE);
    } else if (
      pageName == namespacePrefix + PagesName.B_ONE.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.B_ONE);
    } else if (
      pageName == namespacePrefix + PagesName.C_TWO.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.C_TWO);
    } else if (
      pageName == namespacePrefix + PagesName.D_THREE.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.D_THREE);
    } else if (
      pageName == namespacePrefix + PagesName.E_FOUR.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.E_FOUR);
    } else if (
      pageName == namespacePrefix + PagesName.F_FIVE.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.F_FIVE);
    } else if (
      pageName == namespacePrefix + PagesName.G_SIX.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.G_SIX);
    } else if (
      pageName == namespacePrefix + PagesName.H_SEVEN.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.H_SEVEN);
    } else if (
      pageName == namespacePrefix + PagesName.I_EIGHT.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.I_EIGHT);
    } else if (
      pageName == namespacePrefix + PagesName.J_NINE.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.J_NINE);
    } else if (
      pageName == namespacePrefix + PagesName.K_TEN.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.K_TEN);
    } else if (
      pageName == namespacePrefix + PagesName.L_ELEVEN.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.L_ELEVEN);
    } else if (
      pageName == namespacePrefix + PagesName.M_TWELVE.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.M_TWELVE);
    } else if (
      pageName == namespacePrefix + PagesName.N_THIRTEEN.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.N_THIRTEEN);
    } else if (
      pageName == namespacePrefix + PagesName.O_FOURTEEN.name().toLowercase()
    ) {
      message = mapOfMessages.get(PagesName.O_FOURTEEN);
    }
    return message;
  }

  public PageReference goToNextPage() {
    PageReference pageRef;
    System.debug('pageName ' + pageName);

    if (pageName == namespacePrefix + PagesName.A_TITLE.name().toLowercase()) {
      pageRef = Page.b_one;
    } else if (
      pageName == namespacePrefix + PagesName.B_ONE.name().toLowercase()
    ) {
      pageRef = Page.c_two;
    } else if (
      pageName == namespacePrefix + PagesName.C_TWO.name().toLowercase()
    ) {
      pageRef = Page.d_three;
    } else if (
      pageName == namespacePrefix + PagesName.D_THREE.name().toLowercase()
    ) {
      pageRef = Page.e_four;
    } else if (
      pageName == namespacePrefix + PagesName.E_FOUR.name().toLowercase()
    ) {
      pageRef = Page.f_five;
    } else if (
      pageName == namespacePrefix + PagesName.F_FIVE.name().toLowercase()
    ) {
      pageRef = Page.g_six;
    } else if (
      pageName == namespacePrefix + PagesName.G_SIX.name().toLowercase()
    ) {
      pageRef = Page.h_seven;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.H_SEVEN.name().toLowercase()
    ) {
      pageRef = Page.i_eight;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.I_EIGHT.name().toLowercase()
    ) {
      pageRef = Page.j_nine;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.J_NINE.name().toLowercase()
    ) {
      pageRef = Page.k_ten;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.K_TEN.name().toLowercase()
    ) {
      pageRef = Page.l_eleven;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.L_ELEVEN.name().toLowercase()
    ) {
      pageRef = Page.m_twelve;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.M_TWELVE.name().toLowercase()
    ) {
      pageRef = Page.n_thirteen;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.N_THIRTEEN.name().toLowercase()
    ) {
      pageRef = Page.o_fourteen;
      pageRef.getParameters().put('contactId', conId);
    }
    pageRef.setRedirect(true);
    return pageRef;
  }

  public PageReference goToBackPage() {
    PageReference pageRef;

    if (pageName == namespacePrefix + PagesName.B_ONE.name().toLowercase()) {
      pageRef = Page.a_title;
    } else if (
      pageName == namespacePrefix + PagesName.C_TWO.name().toLowercase()
    ) {
      pageRef = Page.b_one;
    } else if (
      pageName == namespacePrefix + PagesName.D_THREE.name().toLowercase()
    ) {
      pageRef = Page.c_two;
    } else if (
      pageName == namespacePrefix + PagesName.E_FOUR.name().toLowercase()
    ) {
      pageRef = Page.d_three;
    } else if (
      pageName == namespacePrefix + PagesName.F_FIVE.name().toLowercase()
    ) {
      pageRef = Page.e_four;
    } else if (
      pageName == namespacePrefix + PagesName.G_SIX.name().toLowercase()
    ) {
      pageRef = Page.f_five;
    } else if (
      pageName == namespacePrefix + PagesName.H_SEVEN.name().toLowercase()
    ) {
      pageRef = Page.g_six;
    } else if (
      pageName == namespacePrefix + PagesName.I_EIGHT.name().toLowercase()
    ) {
      pageRef = Page.h_seven;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.J_NINE.name().toLowercase()
    ) {
      pageRef = Page.i_eight;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.K_TEN.name().toLowercase()
    ) {
      pageRef = Page.j_nine;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.L_ELEVEN.name().toLowercase()
    ) {
      pageRef = Page.k_ten;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.M_TWELVE.name().toLowercase()
    ) {
      pageRef = Page.l_eleven;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.N_THIRTEEN.name().toLowercase()
    ) {
      pageRef = Page.m_twelve;
      pageRef.getParameters().put('contactId', conId);
    } else if (
      pageName == namespacePrefix + PagesName.O_FOURTEEN.name().toLowercase()
    ) {
      pageRef = Page.n_thirteen;
      pageRef.getParameters().put('contactId', conId);
    }
    pageRef.setRedirect(true);
    return pageRef;
  }
}
