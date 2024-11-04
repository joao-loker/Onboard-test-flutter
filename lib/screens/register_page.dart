import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart'; // Importação do widget personalizado
import '../widgets/custom_buttons.dart'; // Importação do widget personalizado
import '../widgets/custom_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controladores para os campos de entrada
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  // Método para lidar com o registro do usuário
  void _registrar() {
    // Implementar a lógica de registro
  }

  @override
  void dispose() {
    // Limpa os controladores ao finalizar
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
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
                'Criar sua conta',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 28,
                  fontFamily: 'Cera Pro',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                ),
              ),
              const SizedBox(height: 40),
              CustomInputField(
                controller: _nomeController,
                labelText: 'Nome',
              ),
              const SizedBox(height: 16),
              CustomInputField(
                controller: _emailController,
                labelText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                controller: _senhaController,
                labelText: 'Senha',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                controller: _confirmarSenhaController,
                labelText: 'Confirmar Senha',
                obscureText: true,
              ),
              const SizedBox(height: 32),
              CustomButtons.primaryButton(
                text: 'Registrar',
                onPressed: _registrar,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 