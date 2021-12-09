// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:pill_tracker/navigator/main_navigator.dart';
import 'package:pill_tracker/navigator/mixin/error_navigator.dart';
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/util/keys.dart';
import 'package:pill_tracker/viewmodel/login/login_viewmodel.dart';
import 'package:pill_tracker/widget/general/status_bar.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_button.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_input_field.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_progress_indicator.dart';
import 'package:pill_tracker/widget/provider/provider_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> with ErrorNavigatorMixin implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilder: (context, theme, _) => Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => StatusBar.light(
          child: Scaffold(
            backgroundColor: theme.colorsTheme.backgroundDark,
            body: SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  children: [
                    Container(height: ThemeDimens.padding16),
                    Text(
                      'Login',
                      style: theme.lightTextTheme.titleNormal,
                      textAlign: TextAlign.center,
                    ),
                    Container(height: ThemeDimens.padding32),
                    Text(
                      'Just fill in some text. There is no validator for the login',
                      style: theme.lightTextTheme.labelButtonSmall,
                    ),
                    Container(height: ThemeDimens.padding32),
                    PTInputField(
                      key: Keys.emailInput,
                      enabled: !viewModel.isLoading,
                      onChanged: viewModel.onEmailUpdated,
                      hint: 'Email',
                    ),
                    Container(height: ThemeDimens.padding16),
                    PTInputField(
                      key: Keys.passwordInput,
                      enabled: !viewModel.isLoading,
                      onChanged: viewModel.onPasswordUpdated,
                      hint: 'Password',
                    ),
                    Container(height: ThemeDimens.padding16),
                    if (viewModel.isLoading) ...{
                      const PTProgressIndicator.light(),
                    } else
                      PTButton(
                        key: Keys.loginButton,
                        isEnabled: viewModel.isLoginEnabled,
                        text: 'Login',
                        onClick: viewModel.onLoginClicked,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
