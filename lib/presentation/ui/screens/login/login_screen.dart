import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../core/utils/validation_util.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/login/login_provider.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  FocusNode passwordTextFieldNode = FocusNode();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = ref.watch(loginNotifierProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (email) {
                    return ValidatorsUtil.validateEmail(email!);
                  },
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: context.appLoc.email,
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      size: UIDimensions.icon24,
                    ),
                  ),
                  onEditingComplete: () async => FocusScope.of(context)
                      .requestFocus(passwordTextFieldNode),
                ),
                UIDimensions.verticalSpaceMedium,
                TextFormField(
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be longer than 8 characters';
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  focusNode: passwordTextFieldNode,
                  controller: _passwordController,
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: context.appLoc.password,
                    prefixIcon: Icon(
                      Icons.key,
                      size: UIDimensions.icon24,
                    ),
                  ),
                  onEditingComplete: () async => loginNotifier.logIn(
                    _emailController.text.toString(),
                    _passwordController.text.toString(),
                    AccountType.guest,
                    isSignInButton: true,
                  ),
                ),
                UIDimensions.verticalSpaceMedium,
                PrimaryButton(
                  onPressed: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      loginNotifier.logIn(
                        _emailController.text.toString(),
                        _passwordController.text.toString(),
                        AccountType.guest,
                        isSignInButton: true,
                      );
                    }
                  },
                  text: context.appLoc.login,
                ),
                UIDimensions.verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
