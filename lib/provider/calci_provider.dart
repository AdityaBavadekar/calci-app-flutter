import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalciProvider extends ChangeNotifier {
  final compController = TextEditingController();
  final errorController = TextEditingController();
  static const String INVALID_EXPR_ERROR = "Invalid Expression";
  static const String DIVIDE_BY_ZERO_ERROR = "Cannot divide by zero";

  bool isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

  setError(String error) {
    if (error.isNotEmpty) {
      error += "!";
    }
    errorController.text = error;
    notifyListeners();
  }

  bool checkAndSwapOperation(String operation) {
    String s = compController.text;
    if (s.isEmpty || !['+', '-', '*', '/', '%', '^'].contains(operation)) {
      return false;
    }
    if (!isDigit(s, s.length - 1)) {
      compController.text = s.substring(0, s.length - 1) + operation;
      return true;
    }
    return false;
  }

  setValue(String value) {
    String s = compController.text;
    setError("");

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "<":
        compController.text = s.substring(0, s.length - 1);
        break;
      case "AC":
        compController.text = s.substring(0, s.length - 1);
        break;
      case "x":
        if (checkAndSwapOperation("*")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "*";
        break;
      case "÷":
        if (checkAndSwapOperation("/")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "/";
        break;
      case "+":
        if (checkAndSwapOperation("+")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "+";
        break;
      case "-":
        if (checkAndSwapOperation("-")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "-";
        break;
      case "%":
        if (checkAndSwapOperation("%")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "%";
        break;
      case "^":
        if (checkAndSwapOperation("^")) break;
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += "^";
        break;
      case "=":
        if (compController.text.isEmpty ||
            !isDigit(compController.text, compController.text.length - 1)) {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        // Calculte
        evaluateAndCalculate();
        break;
      default:
        if (!isDigit(value, 0) && value != ".") {
          setError(INVALID_EXPR_ERROR);
          break;
        }
        compController.text += value;
    }
  }

  evaluateAndCalculate() {
    String text = compController.text;

    String result = text.interpret().toString();
    if (result == "NaN") {
      setError(DIVIDE_BY_ZERO_ERROR);
      return;
    }
    if (result.endsWith(".0")) {
      result = result.substring(0, result.length - 2);
    }
    compController.text = result;
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
