import 'package:flutter/material.dart';
import 'cadastro_dados_voluntarios.dart'; // Importando a tela de cadastro

class JoinVoluntariosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Junte-se ao VoluntaRios"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.teal.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Cabeçalho
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Faça parte de um movimento que transforma vidas!",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Proteja o Rio Itajaí-Açu e inspire mudanças.",
                            style: TextStyle(fontSize: 18.0, color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.0),

                    // Benefícios
                    Text(
                      "Por que participar?",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    _buildBenefitItem("🌱 Contribua com a preservação ambiental.", const Color.fromARGB(255, 235, 19, 131)),
                    _buildBenefitItem("🎉 Acesse eventos exclusivos para voluntários.", Colors.orange),
                    _buildBenefitItem("🏅 Ganhe medalhas e prêmios virtuais.", Colors.yellow),
                    _buildBenefitItem("🤝 Conecte-se com uma comunidade engajada.", Colors.purple),
                    _buildBenefitItem("📚 Aprenda e compartilhe conhecimento.", const Color.fromARGB(255, 2, 41, 108)),
                    SizedBox(height: 24.0),

                    // Como funciona
                    Text(
                      "Como funciona?",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    _buildStep("1", "Você já criou sua conta, só falta preencher alguns dados para seu cadastro nos voltários estar completo.", const Color.fromARGB(255, 18, 204, 130)),
                    _buildStep("2", "Escolha ações para participar (limpeza, plantio, eventos).", const Color.fromARGB(255, 2, 41, 108)),
                    _buildStep("3", "Conquiste medalhas e acompanhe seu impacto!", Colors.orangeAccent),
                    SizedBox(height: 24.0),

                    // Call to Action
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Pronto para começar sua jornada?",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              // Usando o Navigator.push para ir diretamente para a nova tela de cadastro
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CadastroVoluntariosScreen()), // Aqui é feita a navegação
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade700,
                              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "Preencher dados!",
                              style: TextStyle(fontSize: 18.0,
                              color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Mais Informações",
                                    style: TextStyle(color: Colors.teal.shade700),
                                  ),
                                  content: Text(
                                      "Ao se juntar ao VoluntaRios, você poderá participar de ações incríveis para proteger o meio ambiente."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Fechar"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Saiba mais",
                              style: TextStyle(color: Colors.tealAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: iconColor, size: 24.0),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.0, color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildStep(String step, String description, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: iconColor,
          child: Text(
            step,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            description,
            style: TextStyle(fontSize: 18.0, color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
