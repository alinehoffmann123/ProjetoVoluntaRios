import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AjudaScreen extends StatelessWidget {
  // Função para enviar o e-mail
  void _enviarEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aline.hoffmann@unidavi.edu.br',
      queryParameters: {
        'subject': 'Suporte VoluntáRios', 
        'body': 'Olá, gostaria de saber mais sobre o projeto VoluntáRios.', 
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Não foi possível abrir o aplicativo de e-mail.';
    }
  }

  // Função para ligar para o suporte
  void _ligarParaSuporte() async {
    final Uri telefoneUri = Uri(
      scheme: 'tel',
      path: '47988260930', 
    );

    if (await canLaunch(telefoneUri.toString())) {
      await launch(telefoneUri.toString());
    } else {
      throw 'Não foi possível fazer a ligação.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajuda"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introdução
            Text(
              'Como podemos te ajudar?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Aqui você encontra respostas para dúvidas frequentes ou pode entrar em contato com nosso suporte.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),

            // Perguntas Frequentes
            Text(
              'Perguntas Frequentes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('Como posso me tornar voluntário?'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Você pode se inscrever através do nosso site ou app, onde temos uma lista de eventos para os quais você pode se voluntariar.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Onde acontecem os eventos?'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Os eventos ocorrem principalmente nas margens do Rio Itajaí-Açu, mas também organizamos eventos em outras áreas da cidade.',
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Contato
            Text(
              'Entre em Contato',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Formas de Contato'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'E-mail: aline.hoffmann@unidavi.edu.br',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Telefone: (47) 98826-0930',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: _enviarEmail,
                                child: Text('Enviar E-mail'),
                              ),
                              ElevatedButton(
                                onPressed: _ligarParaSuporte,
                                child: Text('Ligar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Falar com o Suporte'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent.shade700,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
