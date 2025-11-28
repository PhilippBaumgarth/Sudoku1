import 'package:sudoku/sudoku.dart';
import 'package:test/test.dart';

void main() {
  
  test('kann ein einfaches sudoku nicht lösen', loesesudokueinfach);
  test('sollte das sudoku nicht lösen konnen wegen falscher größe', loesesudokugroessefalsch);
  test('sollte das sudoku nicht lösen können', loesesudokunichtloesbar);
  test('die zahl müsste möglich sein', istzahlmoeglichrichtig);
  test('müsste zurückgeben dass die zahl nicht mölich ist in der Zeile', istzahlmoeglichzeilefalsch);
  test('müsste zurückgeben dass die zahl nicht mölich ist in der Spalte', istzahlmoeglichspaltefalsch);
  test('müsste zurückgeben dass die zahl nicht möglich ist in dem Block', istzahlmoeglichblockfalsch);
  test('findeblockgroesse gibt 0 zurück weil es keine gerade mögliche größe gibt', findeblockgroessefalsch);
  test('findeblockgroesse mit richtiger groesse', findeblockgroesserichtig);
}

void loesesudokueinfach() {
  List<String> lines = [
    '5,3,0,0,7,0,0,0,0',
    '6,0,0,1,9,5,0,0,0',
    '0,9,8,0,0,0,0,6,0',
    '8,0,0,0,6,0,0,0,3',
    '4,0,0,8,0,3,0,0,1',
    '7,0,0,0,2,0,0,0,6',
    '0,6,0,0,0,0,2,8,0',
    '0,0,0,4,1,9,0,0,5',
    '0,0,0,0,8,0,0,7,9',
  ];

  bool loesung = loesesudoku(lines);
  assert(loesung == true, 'loesesudoku sollte das Sudoku loesen');
}

void loesesudokugroessefalsch() {
  List<String> lines = [
    '1,0,3,4,5,6,7,8',
    '2,3,4,5,6,7,8,9,1',
    '3,4,5,6,7,8,9,1,2',
    '4,5,6,7,8,9,1,2,3',
    '5,6,7,8,9,1,2,3,4',
    '6,7,8,9,1,2,3,4,5',
    '7,8,9,1,2,3,4,5,6',
    '8,9,1,2,3,4,5,6,7',
    '9,1,2,3,4,5,6,7,8'
  ];

  bool loesung = loesesudoku(lines);
  assert(loesung == false, 'loesesudoku erkennt falsche Größe nicht');
}

void loesesudokunichtloesbar() {
  List<String> lines = [
    '1,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0',
    '0,0,0,0,0,0,0,0,0'
  ];

  bool loesung = loesesudoku(lines);
  assert(loesung == false, 'loesesudoku sollte erkennen, dass es unloesbar ist');
}

void istzahlmoeglichrichtig() {
  List<String> lines = [
    '5,3,0,0,7,0,0,0,0',
    '6,0,0,1,9,5,0,0,0',
    '0,9,8,0,0,0,0,6,0',
    '8,0,0,0,6,0,0,0,3',
    '4,0,0,8,0,3,0,0,1',
    '7,0,0,0,2,0,0,0,6',
    '0,6,0,0,0,0,2,8,0',
    '0,0,0,4,1,9,0,0,5',
    '0,0,0,0,8,0,0,7,9'
  ];

  List<List<String>> feld = [];
  for (int i = 0; i < lines.length; i++) {
    feld.add(lines[i].split(','));
  }

  bool loesung = istzahlmoeglich(feld, 1, 1, 2, 3);
  assert(loesung == true, 'zahl sollte moeglich sein');
}

void istzahlmoeglichzeilefalsch() {
  List<String> lines = [
    '5,3,0,0,7,0,0,0,0',
    '6,0,0,1,9,5,0,0,0',
    '0,9,8,0,0,0,0,6,0',
    '8,0,0,0,6,0,0,0,3',
    '4,0,0,8,0,3,0,0,1',
    '7,0,0,0,2,0,0,0,6',
    '0,6,0,0,0,0,2,8,0',
    '0,0,0,4,1,9,0,0,5',
    '0,0,0,0,8,0,0,7,9'
  ];

  List<List<String>> feld = [];
  for (int i = 0; i < lines.length; i++) {
    feld.add(lines[i].split(','));
  }

  bool loesung = istzahlmoeglich(feld, 1, 4, 1, 3);
  assert(loesung == false, 'zahl ist in dieser zeile nicht moeglich');
}

void istzahlmoeglichspaltefalsch() {
  List<String> lines = [
    '5,3,0,0,7,0,0,0,0',
    '6,0,0,1,9,5,0,0,0',
    '0,9,8,0,0,0,0,6,0',
    '8,0,0,0,6,0,0,0,3',
    '4,0,0,8,0,3,0,0,1',
    '7,0,0,0,2,0,0,0,6',
    '0,6,0,0,0,0,2,8,0',
    '0,0,0,4,1,9,0,0,5',
    '0,0,0,0,8,0,0,7,9'
  ];

  List<List<String>> feld = [];
  for (int i = 0; i < lines.length; i++) {
    feld.add(lines[i].split(','));
  }

  bool loesung = istzahlmoeglich(feld, 7, 0, 7, 3);
  assert(loesung == false, 'zahl ist in dieser spalte nicht moeglich');
}

void istzahlmoeglichblockfalsch() {
  List<String> lines = [
    '5,3,0,0,7,0,0,0,0',
    '6,0,0,1,9,5,0,0,0',
    '0,9,8,0,0,0,0,6,0',
    '8,0,0,0,6,0,0,0,3',
    '4,0,0,8,0,3,0,0,1',
    '7,0,0,0,2,0,0,0,6',
    '0,6,0,0,0,0,2,8,0',
    '0,0,0,4,1,9,0,0,5',
    '0,0,0,0,8,0,0,7,9'
  ];

  List<List<String>> feld = [];
  for (int i = 0; i < lines.length; i++) {
    feld.add(lines[i].split(','));
  }

  bool loesung = istzahlmoeglich(feld, 0, 2, 6, 3);
  assert(loesung == false, 'zahl ist im block nicht moeglich');
}

void findeblockgroessefalsch() {
  int groesse = 5;
  int loesung = findeblockgroesse(groesse);
  assert(loesung == 0, 'findeblockgroesse sollte eigentlich eine 0 zurückgeben');
}


void findeblockgroesserichtig() {
  int groesse = 9;
  int loesung = findeblockgroesse(groesse);
  assert(loesung == 3, 'blockgroesse sollte 3 sein');
}
