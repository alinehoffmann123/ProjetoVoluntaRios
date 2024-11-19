import 'package:flutter/material.dart';

class VolunteerDashboard extends StatelessWidget {
  final String nome;
  final String email;
  final String telefone;
  final String endereco;
  final String preferencias;
  final String habilidades;
  final String motivacao;

  const VolunteerDashboard({
    Key? key,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.preferencias,
    required this.habilidades,
    required this.motivacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados do Voluntário"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: $nome", style: TextStyle(fontSize: 16)),
            Text("Email: $email", style: TextStyle(fontSize: 16)),
            Text("Telefone: $telefone", style: TextStyle(fontSize: 16)),
            Text("Endereço: $endereco", style: TextStyle(fontSize: 16)),
            Text("Preferências: $preferencias", style: TextStyle(fontSize: 16)),
            Text("Habilidades: $habilidades", style: TextStyle(fontSize: 16)),
            Text("Motivação: $motivacao", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
