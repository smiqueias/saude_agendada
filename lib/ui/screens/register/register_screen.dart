import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/core/di.dart';
import 'package:scheduled_health/data/di.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/ui/screens/register/register_view_model.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';
import 'package:scheduled_health/utils/formatters/emoji_input_formatter.dart';

final class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameEditingController =
      TextEditingController();
  late RegisterViewModel _registerViewModel;

  @override
  void initState() {
    super.initState();
    _registerViewModel = RegisterViewModel(
      userRepository: dataLayerGetIt<UserRepository>(),
      appManager: coreLayerGetIt<AppManager>(),
    );
    _usernameEditingController.addListener(
      () {
        _registerViewModel.validateUsernameField(
          username: _usernameEditingController,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _registerViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacings.lg_40,
            horizontal: AppSpacings.sm_24,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Como podemos\nchamar você?",
                  style: context.typography.textLarge.copyWith(
                    color: context.colors.greenDark,
                  ),
                ),
                const SizedBox(height: AppSpacings.lg_40),
                ListenableBuilder(
                  listenable: _registerViewModel,
                  builder: (context, _) {
                    return Column(
                      children: [
                        TextField(
                          controller: _usernameEditingController,
                          style: context.typography.input.copyWith(
                            color: context.colors.gray600,
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: context.colors.gray600,
                          autofocus: true,
                          inputFormatters: [
                            RemoveEmojiInputFormatter(),
                            FilteringTextInputFormatter.deny(
                              RegExp(
                                r'[!@#$%^&*(),.?":{}|<>]',
                              ),
                            ),
                          ],
                          decoration: InputDecoration(
                            error: _registerViewModel.isValidateError
                                ? Text(
                                    _registerViewModel.errorMessage,
                                    style: context.typography.input.copyWith(
                                      color: context.colors.gray600,
                                    ),
                                  )
                                : null,
                            focusColor: context.colors.gray600,
                            hintText: "",
                            hintStyle: context.typography.input.copyWith(
                              color: context.colors.gray600,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: context.colors.gray600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSpacings.lg_40,
                        ),
                        ElevatedButton(
                          onPressed: _registerViewModel.isValidateError ||
                                  _usernameEditingController.text.isEmpty
                              ? null
                              : () async {
                                  await _registerViewModel.registerUser(
                                    username: _usernameEditingController.text,
                                    context: context,
                                  );
                                },
                          child: Text(
                            "Começar",
                            style: context.typography.button.copyWith(
                              color: context.colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
