import 'package:flutter/material.dart';

import '../core/shared/services/url_launch/i_url_launch_service.dart';
import '../core/shared/themes/color_extension.dart';
import '../core/shared/validators/password_validator.dart';
import '../core/shared/widgets/tg_password_field.dart';
import '../core/shared/widgets/tg_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.urlLaunchService,
  });

  final IUrlLaunchService urlLaunchService;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  void login() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    Navigator.of(context).pushReplacementNamed('/home');
  }

  void openPrivacyPolicy() {
    widget.urlLaunchService.launchUrl('https://google.com');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ColorExtension>()!;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.gradient,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TgTextField(
                        label: 'Usuário',
                        controller: TextEditingController(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 20),
                      TgPasswordField(
                        label: 'Senha',
                        validator: passwordValidator,
                        controller: TextEditingController(),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton(
                        onPressed: login,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Entrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: openPrivacyPolicy,
                child: const Text('Política de Privacidade'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
