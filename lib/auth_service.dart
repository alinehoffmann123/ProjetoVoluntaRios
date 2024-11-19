import 'package:cloud_firestore/cloud_firestore.dart';
import 'volunteer.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerVolunteer(String name, String email, String password) async {
    await _firestore.collection('volunteers').add({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<Volunteer?> loginVolunteer(String email, String password) async {
    QuerySnapshot snapshot = await _firestore
        .collection('volunteers')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password) // Use hash na produção
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
}
