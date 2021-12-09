// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:pill_tracker/navigator/main_navigator.dart';
import 'package:pill_tracker/styles/theme_data.dart';
import 'package:pill_tracker/util/env/flavor_config.dart';
import 'package:pill_tracker/util/locale/localization_delegate.dart';
import 'package:pill_tracker/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:pill_tracker/viewmodel/global/global_viewmodel.dart';
import 'package:pill_tracker/widget/provider/provider_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp() : home = null;

  @visibleForTesting
  const InternalApp.test({required this.home});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      lazy: FlavorConfig.isInTest(),
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
        localizationsDelegates: [
          viewModel.localeDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: LocalizationDelegate.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: PTThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: PTThemeData.darkTheme(viewModel.targetPlatform),
        navigatorKey: MainNavigatorWidgetState.navigationKey,
        initialRoute: home == null ? MainNavigatorWidgetState.initialRoute : null,
        onGenerateRoute: MainNavigatorWidgetState.onGenerateRoute,
        navigatorObservers: MainNavigatorWidgetState.navigatorObservers,
        builder: home == null ? (context, child) => MainNavigatorWidget(child: child) : null,
        home: home,
      ),
      create: () => GetIt.I()..init(),
    );
  }
}
