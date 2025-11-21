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

  
}
