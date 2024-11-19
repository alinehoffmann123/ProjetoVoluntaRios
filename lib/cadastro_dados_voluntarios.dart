import 'package:flutter/material.dart';
import 'tela_final_dados.dart';

class CadastroVoluntariosScreen extends StatefulWidget {
  @override
  _CadastroVoluntariosScreenState createState() =>
      _CadastroVoluntariosScreenState();
}

class _CadastroVoluntariosScreenState extends State<CadastroVoluntariosScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Controladores para os campos
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _idadeController = TextEditingController();
  final _ruaController = TextEditingController();
  final _bairroController = TextEditingController();
  final _numeroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cepController = TextEditingController();
  final _horarioController = TextEditingController();
  final _preferenciasController = TextEditingController();
  final _habilidadesController = TextEditingController();
  final _saudeController = TextEditingController();
  final _motivacaoController = TextEditingController();

  List<bool> _completedSteps = [];

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de etapas como não concluídas
    _completedSteps = List.generate(_getSteps().length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Voluntários"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: [
          // Barra de progresso
          LinearProgressIndicator(
            value: (_currentStep + 1) / _getSteps().length,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal.shade700),
          ),
          Expanded(
            child: _getSteps().isEmpty
                ? Center(child: Text('Nenhum passo encontrado.'))
                : Stepper(
                    type: StepperType.vertical,
                    currentStep: _currentStep,
                    onStepContinue: _nextStep,
                    onStepCancel: _prevStep,
                    steps: _getSteps(),
                    controlsBuilder: (context, details) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade700,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: Text("Continuar"),
                          ),
                          if (_currentStep > 0)
                            OutlinedButton(
                              onPressed: details.onStepCancel,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.teal.shade700),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: Text("Voltar",
                                  style: TextStyle(color: Colors.teal.shade700)),
                            ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text('Dados Pessoais'),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe seu nome' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe seu email' : null,
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe seu telefone' : null,
              ),
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(labelText: 'Idade'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe sua idade' : null,
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 0,
        state: _completedSteps.isNotEmpty && _completedSteps[0]
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Text('Endereço'),
        content: Column(
          children: [
            TextFormField(
              controller: _ruaController,
              decoration: InputDecoration(labelText: 'Rua'),
            ),
            TextFormField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Número'),
            ),
            TextFormField(
              controller: _bairroController,
              decoration: InputDecoration(labelText: 'Bairro'),
            ),
            TextFormField(
              controller: _cidadeController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            TextFormField(
              controller: _estadoController,
              decoration: InputDecoration(labelText: 'Estado'),
            ),
            TextFormField(
              controller: _cepController,
              decoration: InputDecoration(labelText: 'CEP'),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _completedSteps.length > 1 && _completedSteps[1]
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Text('Preferências e Saúde'),
        content: Column(
          children: [
            TextFormField(
              controller: _preferenciasController,
              decoration: InputDecoration(labelText: 'Preferências'),
            ),
            TextFormField(
              controller: _habilidadesController,
              decoration: InputDecoration(labelText: 'Habilidades'),
            ),
            TextFormField(
              controller: _horarioController,
              decoration: InputDecoration(labelText: 'Horário de Disponibilidade'),
            ),
            TextFormField(
              controller: _saudeController,
              decoration: InputDecoration(labelText: 'Condições de Saúde'),
            ),
            TextFormField(
              controller: _motivacaoController,
              decoration: InputDecoration(labelText: 'Motivação'),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
        state: _completedSteps.length > 2 && _completedSteps[2]
            ? StepState.complete
            : StepState.indexed,
      ),
    ];
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _completedSteps[_currentStep] = true;
        if (_currentStep < _getSteps().length - 1) {
          _currentStep++;
        } else {
          _submitForm();
        }
      });
    }
  }

  void _prevStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  void _submitForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaFinalDados(
          nome: _nomeController.text,
          email: _emailController.text,
          telefone: _telefoneController.text,
          idade: _idadeController.text,
          rua: _ruaController.text,
          numero: _numeroController.text,
          bairro: _bairroController.text,
          cidade: _cidadeController.text,
          estado: _estadoController.text,
          cep: _cepController.text,
          horario: _horarioController.text,
          preferencias: _preferenciasController.text,
          habilidades: _habilidadesController.text,
          saude: _saudeController.text,
          motivacao: _motivacaoController.text,
        ),
      ),
    );
  }
}
