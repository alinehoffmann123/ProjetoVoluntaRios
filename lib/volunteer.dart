class Volunteer {
  final String id;
  final String name;
  final String email;
  final String senha;
  final String telefone;

  Volunteer({required this.id, required this.name, required this.email, required this.senha, required this.telefone});

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      senha: json['senha'],
      telefone: json['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'senha': senha,
      'telefone': telefone,
    };
  }
}
