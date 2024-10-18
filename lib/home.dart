import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VoluntaRios - Home', style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade700,
        elevation: 10, // Elevação para profundidade
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              _buildAnimatedGreeting(),

              SizedBox(height: 20),

              // Nível Atual com Animação
              _buildAnimatedCard(
                title: 'Seu Nível',
                content: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow.shade700, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'Nível 5 - Guardião do Rio',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Conquistas com animação ao aparecer
              _buildAnimatedCard(
                title: 'Conquistas',
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAchievement('assets/medalha1.png', 'Protetor da Natureza'),
                    _buildAchievement('assets/medalha2.png', 'Guardião do Rio'),
                    _buildAchievement('assets/medalha3.png', 'Ajudante Verde'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Ações Recentes com efeito Hero
              _buildActionsSection(),

              SizedBox(height: 20),

              // Próximas Missões com animação
              _buildAnimatedCard(
                title: 'Próximas Missões',
                content: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.teal.shade700),
                      title: Text('Plantio de árvores nativas'),
                      subtitle: Text('Data: 20 de Outubro, 2024'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.teal.shade700),
                      title: Text('Palestra sobre preservação ambiental'),
                      subtitle: Text('Data: 25 de Outubro, 2024'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Saudação com animação de fade
  Widget _buildAnimatedGreeting() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(seconds: 1),
      child: Text(
        'Bem-vinda, Aline!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade700,
        ),
      ),
    );
  }

  // Construção de uma card com animação suave
  Widget _buildAnimatedCard({required String title, required Widget content}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade200.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  // Conquistas
  Widget _buildAchievement(String assetPath, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(assetPath),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.teal.shade800,
          ),
        ),
      ],
    );
  }

  // Seção de Ações Recentes
  Widget _buildActionsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ações Recentes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          SizedBox(height: 10),
          Hero(
            tag: 'participation',
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Participou da limpeza do Rio Itajaí-açu'),
              subtitle: Text('Data: 10 de Outubro, 2024'),
            ),
          ),
          Hero(
            tag: 'flyers',
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Distribuiu folhetos de conscientização'),
              subtitle: Text('Data: 5 de Outubro, 2024'),
            ),
          ),
        ],
      ),
    );
  }
}
