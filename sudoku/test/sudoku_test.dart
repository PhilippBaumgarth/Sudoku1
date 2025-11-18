import 'package:sudoku/sudoku.dart';
import 'package:test/test.dart';

void main() {
  test('loesesudoku löst ein unvollständiges 9x9 Sudoku',() {
    List<String> testline1 = [
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

    bool result1 = loesesudoku(testline1);
    assert(result1 == true, 'loesesudoku hat einen Fehler bei einem gültigen Sudoku');
  });
  test('loesesudoku größe falsch',() {
    List<String> testline2 = [
      '5,3,0,0,7,0,0,0',      
      '6,0,0,1,9,5,0,0,0',
      '0,9,8,0,0,0,0,6,0',
      '8,0,0,0,6,0,0,0,3',
      '4,0,0,8,0,3,0,0,1',
      '7,0,0,0,2,0,0,0,6',
      '0,6,0,0,0,0,2,8,0',
      '0,0,0,4,1,9,0,0,5',
      '0,0,0,0,8,0,0,7,9'
    ];
    bool result2 = loesesudoku(testline2);
    assert(result2 == false, 'loesesudoku erkennt falsche Größe nicht');
  });
}

