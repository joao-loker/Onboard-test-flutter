import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart'; // Importação do widget personalizado
import '../widgets/custom_buttons.dart'; // Importação do widget personalizado
import 'register_page.dart';
import '../widgets/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para os campos de entrada
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Método para lidar com o login do usuário
  void _fazerLogin() {
    // Implementar a lógica de login
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
          top: 8.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bem-vindo de volta',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 28,
                  fontFamily: 'Cera Pro',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                ),
              ),
              const SizedBox(height: 40),
              // Campo E-mail usando o widget personalizado
              CustomInputField(
                controller: _emailController,
                labelText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Campo Senha usando o widget personalizado
              CustomInputField(
                controller: _senhaController,
                labelText: 'Senha',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              // Botão Esqueci minha senha
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Ação para recuperar senha
                  },
                  child: const Text('Esqueci minha senha'),
                ),
              ),
              const SizedBox(height: 32),
              // Botão Login usando o CustomButtons
              CustomButtons.primaryButton(
                text: 'Entrar',
                onPressed: _fazerLogin,
              ),
              const SizedBox(height: 16),
              // Botão para criar uma nova conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta?'),
                  TextButton(
                    onPressed: () {
                      // Navegar para a tela de registro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text('Criar conta'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 