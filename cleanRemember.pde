
void setup () {
  size(300, 300);
  String[] txt = loadStrings("remember01.txt");
  ArrayList<String> result = new ArrayList<String>();
  String allowedChars = " ,;:!?.1234567890AZERTYUIOPQSDFGHJKLMWXCVBN\"\'()&azertyuiopqsdfghjklmwxcvbn-$%";
  for (int i=1; i<txt.length; i++) {
    if (txt[i-1].equals("======================================== SAMPLE 1 ========================================")) {
      String thisText = txt[i];
      thisText = "I remember "+thisText;
      int whereToCut = -1;
      boolean quotesOn = false;
      boolean sQuotesOn = false;
      for (int j=0; j<thisText.length(); j++) {
        if (whereToCut==-1) {
          if (thisText.charAt(j)=='"') quotesOn^=true;
          if (j>=1) if (thisText.charAt(j-1)==' ') if (thisText.charAt(j)=='\'') sQuotesOn^=true;
          if (thisText.charAt(j)=='.' || thisText.charAt(j)=='!' || thisText.charAt(j)=='?') {
            if (!quotesOn && !sQuotesOn) {
              whereToCut=j;
            }
          }
        }
      }
      if (whereToCut!=-1) thisText = thisText.substring(0, whereToCut+1);
      boolean unusualChars = false;
      for (int j=0; j<thisText.length(); j++) {
        for (int k=0; k<allowedChars.length(); k++) {
          if (strPos(allowedChars, str(thisText.charAt(j)))==-1) unusualChars=true;
        }
      }
      if (!unusualChars) {
        if (thisText.length()>12 && thisText.length()<=300) {
          if (strPos(thisText, "__")==-1) {
            while (strPos(thisText, "  ")!=-1) thisText = findAndReplace(thisText, "  ", " ");
            result.add(thisText);
            result.add("");
          }
        }
      }
    }
  }
  saveStrings("result.txt", result.toArray(new String[result.size()]));
  exit();
}

void draw() {
}
