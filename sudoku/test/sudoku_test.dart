import 'package:sudoku/sudoku.dart';
import 'package:test/test.dart';

void main() {
  test('loesesudoku loest ein einfaches 9x9 Sudoku', () {
    List<String> testline1 = [
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

    bool loesung = loesesudoku(testline1);
    assert(loesung == true, 'loesesudoku sollte das Sudoku korrekt loesen');
  });

  test('loesesudoku groeße falsch', () {
    List<String> testline2 = [
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

    bool loesung = loesesudoku(testline2);
    assert(loesung == false, 'loesesudoku erkennt die falsche Groeße nicht');
  });

  test('loesesudoku kann das sudoku nicht nicht richtig loesen', () {
    List<String> testline3 = [
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
    bool loesung = loesesudoku(testline3);
    assert(loesung == false, 'loesesudoku erkennt nicht das es nicht loesbar ist');
  });

  test('istzahlmoeglich mit richitger zahl', () {
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
    bool loesung = istzahlmoeglich(lines, 1, 1, 2, 3);
    assert(loesung == true, 'Istzahlmoeglich sagt die zahl passt nicht obwohl sie passt');
  });

  test('istzahlmoeglich mit falscher zahl in zeile', () {
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
    bool loesung = istzahlmoeglich(lines, 1, 4, 1, 3);
    assert(loesung == false, 'Istzahlmoeglich sollte eigentlich zurueckgeben dass die zahl in der zeile nicht möglich ist');
  });

  test('istzahlmoeglich mit falscher zahl in spalte', () {
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
    bool loesung = istzahlmoeglich(lines, 7, 0, 7, 3);
    assert(loesung == false, 'Istzahlmoeglich sollte eigentlich zurueckgeben dass die zahl in der spalte nicht möglich ist');
  });
  test('istzahlmoeglich mit falscher zahl in block', () {
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
    bool loesung = istzahlmoeglich(lines, 0, 2, 6, 3);
    assert(loesung == false, 'Istzahlmoeglich sollte eigentlich zurueckgeben dass die zahl im block nicht möglich ist');
  });

  test('findeblockgroesse mit richtiger groesse', () {
    int groesse = 9;
    int loesung = findeblockgroesse(groesse);
    assert(loesung == 3, 'findeblockgroesse gibt die falsche groesse des blocks zurück');
  });

  test('findeblockgroesse mit richtiger groesse', () {
    int groesse = 5;
    int loesung = findeblockgroesse(groesse);
    assert(loesung == 0, 'findeblockgroesse sollte eigentlich eine 0 zurückgeben');
  });
}
