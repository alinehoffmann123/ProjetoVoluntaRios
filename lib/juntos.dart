import 'package:flutter/material.dart';

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
                    _buildBenefitItem("🌱 Contribua com a preservação ambiental.", Colors.green),
                    _buildBenefitItem("🎉 Acesse eventos exclusivos para voluntários.", Colors.orange),
                    _buildBenefitItem("🏅 Ganhe medalhas e prêmios virtuais.", Colors.yellow),
                    _buildBenefitItem("🤝 Conecte-se com uma comunidade engajada.", Colors.purple),
                    _buildBenefitItem("📚 Aprenda e compartilhe conhecimento.", Colors.blueAccent),
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
                    _buildStep("1", "Crie uma conta ou faça login.", Colors.teal),
                    _buildStep("2", "Escolha ações para participar (limpeza, plantio, eventos).", Colors.blue),
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
                              Navigator.pushNamed(context, "/signup");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade700,
                              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "Cadastre-se agora!",
                              style: TextStyle(fontSize: 18.0),
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


