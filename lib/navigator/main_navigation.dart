// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:drift/drift.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToLogin();

  void goToHome();


  void goToDebugPlatformSelector();

  void goToLicense();

  void closeDialog();

  void goToDatabase(GeneratedDatabase db);

  void goBack<T>({T? result});

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T> implements MainNavigation {}
