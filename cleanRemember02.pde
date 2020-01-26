
void setup () {
  size(300, 300);
  String[] txt = loadStrings("result FR.txt");
  ArrayList<String> result = new ArrayList<String>();
  int nbSouviens=0;
  for (int i=0; i<txt.length; i++) {
    if (txt[i].length()>14) {
      if (txt[i].substring(0, 14).equals("Je me souviens")) {
        result.add("<div style=\"text-align:center\"><b>"+str(nbSouviens)+"</b><div/>");
        result.add("<div style=\"text-align:justify\">"+txt[i]+"</div>");
        result.add("<br/><br/>");
        nbSouviens++;
      }
    }
  }
  saveStrings("result.html", result.toArray(new String[result.size()]));
  exit();
}

void draw() {
}
