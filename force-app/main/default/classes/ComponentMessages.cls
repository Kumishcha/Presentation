public with sharing class ComponentMessages {
  public static Map<PagesName, String> getMap() {
    Map<PagesName, String> mapOfMessages = new Map<PagesName, String>();

    mapOfMessages.put(PagesName.A_TITLE, '');
    mapOfMessages.put(PagesName.B_ONE, Label.messageOfPageB);
    mapOfMessages.put(PagesName.C_TWO, Label.messageOfPageC);
    mapOfMessages.put(PagesName.D_THREE, Label.messageOfPageD);
    mapOfMessages.put(PagesName.E_FOUR, Label.messageOfPageE);
    mapOfMessages.put(PagesName.F_FIVE, Label.messageOfPageF);
    mapOfMessages.put(PagesName.G_SIX, Label.messageOfPageG);
    mapOfMessages.put(PagesName.H_SEVEN, Label.messageOfPageH);
    mapOfMessages.put(PagesName.I_EIGHT, Label.messageOfPageI);
    mapOfMessages.put(PagesName.J_NINE, Label.messageOfPageJ);
    mapOfMessages.put(PagesName.K_TEN, Label.messageOfPageK);
    mapOfMessages.put(PagesName.L_ELEVEN, Label.messageOfPageL);
    mapOfMessages.put(PagesName.M_TWELVE, Label.messageOfPageM);
    mapOfMessages.put(PagesName.N_THIRTEEN, Label.messageOfPageN);
    mapOfMessages.put(PagesName.O_FOURTEEN, Label.messageOfPageO);

    return mapOfMessages;
  }
}
