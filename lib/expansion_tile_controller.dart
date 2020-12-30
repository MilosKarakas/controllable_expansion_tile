import 'package:flutter/material.dart';

class ExpansionTileController {
  VoidCallback _collapseFunction;
  VoidCallback _expandFunction;

  ExpansionTileController();

  set collapseFunction(VoidCallback function) {
    this._collapseFunction = function;
  }

  set expandFunction(VoidCallback function) {
    this._expandFunction = function;
  }

  void collapse() {
    if (this._collapseFunction != null) {
      this._collapseFunction.call();
    }
  }

  void expand() {
    if (this._expandFunction != null) {
      this._expandFunction.call();
    }
  }

  void dispose () {
    _collapseFunction = null;
    _expandFunction = null;
  }
}