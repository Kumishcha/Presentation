public with sharing class ComponentMessages {
  public static Map<PagesName, String> getMap() {
    Map<PagesName, String> mapOfMessages = new Map<PagesName, String>();

    mapOfMessages.put(PagesName.A_TITLE, '');
    mapOfMessages.put(
      PagesName.B_ONE,
      'What is Visualforce? Visualforce System Architecture - Standard User Mode'
    );
    mapOfMessages.put(
      PagesName.C_TWO,
      'What is a Visualforce Page? Where You Can Use Visualforce Page?'
    );
    mapOfMessages.put(PagesName.D_THREE, 'Create & Edit Visualforce Pages');
    mapOfMessages.put(
      PagesName.E_FOUR,
      'Standard Controllers VS Custom Controllers'
    );
    mapOfMessages.put(
      PagesName.F_FIVE,
      'Standard Controller, Controller Extensions, Custom Component, Order of Execution'
    );
    mapOfMessages.put(PagesName.G_SIX, 'Create new Contact to open next page');
    mapOfMessages.put(
      PagesName.H_SEVEN,
      'Ways to call controller methods(check each function to open next page)'
    );
    mapOfMessages.put(
      PagesName.I_EIGHT,
      'Using Aura & LWC in Visualforce Pages'
    );
    mapOfMessages.put(
      PagesName.J_NINE,
      'Using CSS in Visualforce Pages. Visualforce provides 4 types of stylesheets:'
    );
    mapOfMessages.put(
      PagesName.K_TEN,
      'Using JavaScript with Visualforce Pages'
    );
    mapOfMessages.put(PagesName.L_ELEVEN, 'Visualforce Page’s View State');
    mapOfMessages.put(PagesName.M_TWELVE, 'Ways to reduce the view state');
    mapOfMessages.put(PagesName.N_THIRTEEN, 'Visualforce Pages Limits');
    mapOfMessages.put(PagesName.O_FOURTEEN, 'Resources');

    return mapOfMessages;
  }
}
