import 'package:flutter/material.dart';

class TelaFinalDados extends StatelessWidget {
  final String nome;
  final String email;
  final String telefone;
  final String idade;
  final String rua;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  final String horario;
  final String preferencias;
  final String habilidades;
  final String saude;
  final String motivacao;

  TelaFinalDados({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.idade,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.horario,
    required this.preferencias,
    required this.habilidades,
    required this.saude,
    required this.motivacao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Cadastrados'),
        backgroundColor: Colors.teal.shade700,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navegar de volta para a página inicial (home)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAnimatedDataRow('Nome', nome),
              _buildAnimatedDataRow('Email', email),
              _buildAnimatedDataRow('Telefone', telefone),
              _buildAnimatedDataRow('Idade', idade),
              _buildAnimatedDataRow(
                'Endereço',
                '$rua, $numero, $bairro, $cidade, $estado, $cep',
              ),
              _buildAnimatedDataRow('Horário Disponível', horario),
              _buildAnimatedDataRow('Preferências', preferencias),
              _buildAnimatedDataRow('Habilidades', habilidades),
              _buildAnimatedDataRow('Saúde', saude),
              _buildAnimatedDataRow('Motivação', motivacao),
              SizedBox(height: 30),
              _buildStyledButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Função para criar uma linha de dados com animação
  Widget _buildAnimatedDataRow(String label, String value) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.teal.shade700,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Função para o botão estilizado
  Widget _buildStyledButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Voltar para a página inicial
        Navigator.popUntil(context, ModalRoute.withName('/'));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade700,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 8,
      ),
      child: Text(
        'Voltar para a Home',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
