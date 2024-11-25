import 'package:cloud_firestore/cloud_firestore.dart';
import 'volunteer.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Volunteer?> loginVolunteer(String email, String password) async {
    QuerySnapshot snapshot = await _firestore
        .collection('volunteers')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;
      return Volunteer(
        id: doc.id,
        name: doc['name'],
        email: doc['email'],
      );
    }
    return null;
  }

  // Função para cadastrar um voluntário e retornar o ID do documento
  Future<String> registerVoluntario(
    String nome,
    String email,
    String telefone,
    String idade,
    String rua,
    String numero,
    String bairro,
    String cidade,
    String estado,
    String cep,
    String horario,
    String preferencias,
    String habilidades,
    String saude,
    String motivacao,
  ) async {
    try {
      // Adiciona o voluntário ao Firestore
      DocumentReference docRef = await _firestore.collection('voluntarios').add({
        'Nome do Voluntário': nome,
        'E-mail': email,
        'Telefone': telefone,
        'Idade': idade,
        'Rua': rua,
        'Número': numero,
        'Bairro': bairro,
        'Cidade': cidade,
        'Estado': estado,
        'CEP': cep,
        'Horários disponíveis': horario,
        'Preferência de Trabalho': preferencias,
        'Habilidades': habilidades,
        'Saúde': saude,
        'Motivação': motivacao,
      });

      return docRef.id;
    } catch (e) {
      throw Exception('Erro ao cadastrar o voluntário: $e');
    }
  }
}