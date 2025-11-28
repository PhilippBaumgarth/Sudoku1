bool loesesudoku(List<String> lines) {
  int groesse = lines.length;
  int blockgroesse = findeblockgroesse(groesse);
  if (blockgroesse == 0) {
    print("Das Sudoku ist kein richtiges Quadrat");
    return false;
  }


  List<List<String>> feld = [];
  for (int i = 0; i < groesse; i++) {
    List<String> zeile = lines[i].split(',');  // <-- einziger split
    if (zeile.length != groesse) {
      return false;
    }
    feld.add(zeile);
  }

  bool hatSichGeaendert = true;
  while (hatSichGeaendert) {
    hatSichGeaendert = false;
    for (int zeilenindex = 0; zeilenindex < groesse; zeilenindex++) {
      List<String> zeilestrings = feld[zeilenindex];

      for (int spaltenindex = 0; spaltenindex < groesse; spaltenindex++) {
        if (zeilestrings[spaltenindex] == '0') {
          // Mögliche Zahlen sammeln
          List<int> moegliche = [];
          for (int zahl = 1; zahl <= groesse; zahl++) {
            if (istzahlmoeglich(feld, zeilenindex, spaltenindex, zahl, blockgroesse)) {
              moegliche.add(zahl);
            }
          }
          // Wenn genau eine Zahl möglich ist setze sie
          if (moegliche.length == 1) {
            zeilestrings[spaltenindex] = moegliche[0].toString();
            hatSichGeaendert = true;
          }
        }
      }
    }
  }

  // prüfen, ob vollständig gelöst
  for (int i = 0; i < groesse; i++) {
    if (feld[i].contains('0')) {
      return false;
    }
  }

  for (int i = 0; i < groesse; i++) {
    lines[i] = feld[i].join(',');
  }

  return true;
}

bool istzahlmoeglich(List<List<String>> feld,int zeilenindex,int spaltenindex,int zahl,int blockgroesse) {
  int groesse = feld.length;

  // Zeile prüfen
  List<String> zeile = feld[zeilenindex];
  for (int i = 0; i < groesse; i++) {
    if (int.parse(zeile[i]) == zahl) {
      return false;
    }
  }

  // Spalte prüfen
  for (int r = 0; r < groesse; r++) {
    if (int.parse(feld[r][spaltenindex]) == zahl) { 
      return false;
    }
  }

  // Block prüfen
  int startzeile = (zeilenindex ~/ blockgroesse) * blockgroesse;
  int startspalte = (spaltenindex ~/ blockgroesse) * blockgroesse;
  for (int r = 0; r < blockgroesse; r++) {
    List<String> blockzeile = feld[startzeile + r];
    for (int c = 0; c < blockgroesse; c++) {
      if (int.parse(blockzeile[startspalte + c]) == zahl) {
        return false;
      }
    }
  }
  return true;
}

// einzelne blockgroesse finden
int findeblockgroesse(int groesse) {
  for (int i = 1; i * i <= groesse; i++) {
    if (i * i == groesse) {
      return i;
    }
  }
  
  return 0;
}
