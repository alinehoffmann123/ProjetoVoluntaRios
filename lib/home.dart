import 'package:flutter/material.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bem-vindo ao VoluntaRios!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Junte-se a nós na proteção do Rio Itajaí-Açu.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Section about the project
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre o VoluntaRios',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O VoluntaRios é um projeto dedicado à preservação e conservação do Rio Itajaí-Açu e suas águas. Através do nosso sistema de voluntariado, qualquer pessoa pode contribuir com o meio ambiente realizando atividades como a limpeza das margens do rio, plantio de árvores e outras iniciativas de conscientização ambiental.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Section: What we do
                    Text(
                      'O que fazemos?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No VoluntaRios, organizamos eventos de limpeza do rio, campanhas de educação ambiental e ações que visam preservar a biodiversidade ao redor da região. Qualquer pessoa pode se inscrever como voluntário e ajudar a proteger nosso meio ambiente.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Section: How you can help
                    Text(
                      'Como você pode ajudar?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Você pode se tornar um voluntário e participar de diversas atividades relacionadas ao cuidado com o Rio Itajaí-Açu. Junte-se a nós em mutirões de limpeza, projetos educativos ou ajude com doações e apoio logístico.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Call to action - Button to register
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text('Junte-se ao VoluntaRios'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent.shade700,
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
