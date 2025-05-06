import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kart_flutter/routing/routes.dart';
import 'package:kart_flutter/ui/login/login_viewmodel.dart';
import 'package:result_command/result_command.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginPage({super.key, required this.viewModel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_listener);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_listener);
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _listener() {
    if (widget.viewModel.login.isSuccess) {
      if (mounted &&
          context.mounted &&
          ModalRoute.of(context)?.settings.name?.contains(Routes.login) ==
              true) {
        context.goNamed(Routes.home);
      }
    }
    if (widget.viewModel.login.isFailure) {
      final failure = widget.viewModel.login.value as FailureCommand;
      final msg = failure.error.toString().replaceAll('Exception: ', '');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(msg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListenableBuilder(
        listenable: widget.viewModel.login,
        builder: (context, child) {
          final isRunning = widget.viewModel.login.isRunning;

          if (isRunning) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Login'),
                    controller: _loginController,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Insira o seu login';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    controller: _senhaController,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Insira a sua senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await widget.viewModel.login.execute(
                          _loginController.text,
                          _senhaController.text,
                        );
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
