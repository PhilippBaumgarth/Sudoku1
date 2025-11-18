#!/usr/bin/env dart
import 'dart:io';
import 'package:sudoku/sudoku.dart' as sudoku;

void main() {
  File file = File("sudoku.csv");
  List<String> sudokulines = file.readAsLinesSync();

  if (sudoku.loesesudoku(sudokulines)) {
    print("Sudoku gelöst:");
    for (int i = 0; i < sudokulines.length; i++) {
      print(sudokulines[i]);
    }
  } else {
    print("Sudoku kann nicht gelöst werden.");
  }
}
