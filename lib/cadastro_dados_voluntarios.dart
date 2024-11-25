import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'tela_final_dados.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _idadeController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cepController = TextEditingController();
  final _horarioController = TextEditingController();
  final _preferenciasController = TextEditingController();
  final _habilidadesController = TextEditingController();
  final _saudeController = TextEditingController();
  final _motivacaoController = TextEditingController();

  final _pageController = PageController();
  int _currentPage = 0;

  // Função para salvar os dados do voluntário
  void _cadastrarVoluntario() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String telefone = _telefoneController.text;
    String idade = _idadeController.text;
    String rua = _ruaController.text;
    String numero = _numeroController.text;
    String bairro = _bairroController.text;
    String cidade = _cidadeController.text;
    String estado = _estadoController.text;
    String cep = _cepController.text;
    String horario = _horarioController.text;
    String preferencias = _preferenciasController.text;
    String habilidades = _habilidadesController.text;
    String saude = _saudeController.text;
    String motivacao = _motivacaoController.text;

    try {
      String userId = await AuthService().registerVoluntario(
        nome,
        email,
        telefone,
        idade,
        rua,
        numero,
        bairro,
        cidade,
        estado,
        cep,
        horario,
        preferencias,
        habilidades,
        saude,
        motivacao,
      );
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro realizado!'),
          content: Text(
            'Seu cadastro foi concluído com sucesso. Aguarde até que nossa equipe entre em contato.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaFinalDados(userId: userId),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao cadastrar!')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.teal.shade700;
    Color accentColor = Colors.blue; 

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Voluntário'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentPage + 1) / 4,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPersonalInfoPage(primaryColor),
                  _buildAddressPage(primaryColor),
                  _buildAvailabilityPage(primaryColor),
                  _buildAdditionalInfoPage(primaryColor),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Anterior'),
                  ),
                if (_currentPage < 3)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Próximo'),
                  ),
                if (_currentPage == 3)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _cadastrarVoluntario,
                    child: Text('Cadastrar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, Color color, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: color) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfoPage(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Nome', _nomeController, color, icon: Icons.person),
        _buildTextField('Email', _emailController, color, icon: Icons.email),
        _buildTextField('Telefone', _telefoneController, color, icon: Icons.phone),
        _buildTextField('Idade', _idadeController, color, icon: Icons.cake),
      ],
    );
  }

  Widget _buildAddressPage(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Rua', _ruaController, color, icon: Icons.location_on),
        _buildTextField('Número', _numeroController, color),
        _buildTextField('Bairro', _bairroController, color),
        _buildTextField('Cidade', _cidadeController, color, icon: Icons.location_city),
        _buildTextField('Estado', _estadoController, color),
        _buildTextField('CEP', _cepController, color),
      ],
    );
  }

  Widget _buildAvailabilityPage(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Horário disponível', _horarioController, color),
        _buildTextField('Preferências de trabalho', _preferenciasController, color),
      ],
    );
  }

  Widget _buildAdditionalInfoPage(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Habilidades', _habilidadesController, color),
        _buildTextField('Saúde', _saudeController, color),
        _buildTextField('Motivação', _motivacaoController, color),
      ],
    );
  }
}
