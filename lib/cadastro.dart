import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'juntos.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.teal.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Campo de e-mail com validação de e-mail
                  _buildTextField(
                    Icons.email, 
                    'E-mail', 
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),

                  _buildTextField(Icons.lock, 'Senha', isPassword: true, controller: passwordController),
                  SizedBox(height: 20),

                  _buildTextField(Icons.lock, 'Confirmar Senha', isPassword: true, controller: confirmPasswordController),
                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () async {
                      // Validação de senha
                      if (passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('A senha deve ter pelo menos 6 caracteres.'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      // Validação de correspondência de senhas
                      if (passwordController.text != confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('As senhas não correspondem.'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      // Tentativa de cadastro
                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Usuário cadastrado com sucesso!'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => JoinVoluntariosScreen()),
                        );
                      } catch (e) {
                        String errorMessage;

                        // Verificar tipo de erro do Firebase
                        if (e is FirebaseAuthException) {
                          switch (e.code) {
                            case 'invalid-email':
                              errorMessage = 'O endereço de e-mail está mal formatado.';
                              break;
                            case 'email-already-in-use':
                              errorMessage = 'Este e-mail já está em uso. Tente outro e-mail.';
                              break;
                            case 'weak-password':
                              errorMessage = 'A senha é muito fraca. Use pelo menos 6 caracteres.';
                              break;
                            default:
                              errorMessage = 'Ocorreu um erro ao cadastrar. Tente novamente.';
                          }
                        } else {
                          errorMessage = 'Ocorreu um erro inesperado. Tente novamente.';
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage, style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: Text('Registrar', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade700,
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label,
      {bool isPassword = false, TextEditingController? controller, List<TextInputFormatter>? inputFormatters, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      width: 400,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
