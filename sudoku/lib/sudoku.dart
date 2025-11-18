bool loesesudoku(List<String> lines) {
  int groesse = lines.length;
  int blockgroesse = findeblockgroesse(groesse);
  if (blockgroesse == 0) return false;

  bool hatSichGeaendert = true;

  while (hatSichGeaendert) {
    hatSichGeaendert = false;
    for (int zeilenindex = 0; zeilenindex < groesse; zeilenindex++) {
      List<String> zeilestrings = lines[zeilenindex].split(',');
      for (int spaltenindex = 0; spaltenindex < groesse; spaltenindex++) {
        if (zeilestrings[spaltenindex] == '0') {
          // Mögliche Zahlen sammeln
          List<int> moegliche = [];
          for (int zahl = 1; zahl <= groesse; zahl++) {
            if (istzahlmoeglich(lines, zeilenindex, spaltenindex, zahl, blockgroesse)) {
              moegliche.add(zahl);
            }
          }
          // Wenn genau eine Zahl möglich ist setze sie
          if (moegliche.length == 1) {
            zeilestrings[spaltenindex] = moegliche[0].toString();
            lines[zeilenindex] = zeilestrings.join(',');
            hatSichGeaendert = true;
          }
        }
      }
    }
  }

  // prüfen, ob vollständig gelöst
  for (int i = 0; i < groesse; i++) {
    if (lines[i].contains('0')) return false;
  }

  return true;
}

bool istzahlmoeglich(
    List<String> lines,
    int zeilenindex,
    int spaltenindex,
    int zahl,
    int blockgroesse) {

  int groesse = lines.length;

  // Zeile prüfen
  List<String> zeile = lines[zeilenindex].split(',');
  for (int i = 0; i < groesse; i++) {
    if (int.parse(zeile[i]) == zahl) return false;
  }

  // Spalte prüfen
  for (int r = 0; r < groesse; r++) {
    if (int.parse(lines[r].split(',')[spaltenindex]) == zahl) return false;
  }

  // Block prüfen
  int startzeile = (zeilenindex ~/ blockgroesse) * blockgroesse;
  int startspalte = (spaltenindex ~/ blockgroesse) * blockgroesse;

  for (int r = 0; r < blockgroesse; r++) {
    List<String> blockzeile = lines[startzeile + r].split(',');
    for (int c = 0; c < blockgroesse; c++) {
      if (int.parse(blockzeile[startspalte + c]) == zahl) return false;
    }
  }

  return true;
}

int findeblockgroesse(int groesse) {
  for (int i = 1; i * i <= groesse; i++) {
    if (i * i == groesse) {
      return i;
    }
  }
  print("Das Sudoku ist kein richtiges Quadrat");
  return 0;
}
