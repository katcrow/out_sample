import 'package:flutter/material.dart';

void hideKeyboard({required BuildContext context}){
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    FocusScope.of(context).unfocus();
  }
}